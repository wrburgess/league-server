HEROKU_ACCOUNT = "wrburgess"
STAGING_APP    = "league-staging"
PRODUCTION_APP = "league-production"

def system_try_and_fail(command)
  sh command do |ok, res|
    if !ok
      system_try_and_fail "git checkout master"
      raise "FAILURE: Error running `#{command}`. (Pwd: #{Dir.pwd}, exit status: #{res.exitstatus}).\nAborting..."
    end
  end
end

def make_git_timestamp
  "#{@env}-deploy-#{Time.now.to_s.gsub(/:/, "-").gsub(/\s/, "-").gsub(/--/, "-")}"
end

def check_master_branch
  branches = (`git branch`).split
  branches.each_with_index do |br, i|
    if br == "*" && branches[i+1] != "master"
      raise 'FAILURE! You are not on "master", you cannot deploy from other branches.\nAborting...'
    end
  end
end

def check_pending_changes
  status = `git status`
  raise "FAILURE: You cannot deploy with pending changes.\nAborting..." if status !~ /nothing to commit/
end

def set_heroku_account
  system_try_and_fail "heroku accounts:set #{HEROKU_ACCOUNT}"
  puts "******** Using Heroku account: #{HEROKU_ACCOUNT}"
end

def run_deploy
  timestamp = make_git_timestamp
  deploy_tag(timestamp) if @strategy == 'tag'
  deploy_branch(timestamp) if @strategy == 'branch'
end

def deploy_tag(timestamp)
  puts "******** Tagging..."
  system_try_and_fail "git tag #{timestamp}"
  system_try_and_fail "git push origin master --tags"
  system_try_and_fail "git push #{@repo} master -f"
  puts "******** Tag: #{timestamp} pushed to Heroku: #{@repo}"
end

def deploy_branch(timestamp)
  puts "******** Branching..."
  system_try_and_fail "git checkout -b #{timestamp}"
  system_try_and_fail "git push origin #{timestamp}"
  system_try_and_fail "git push #{@repo} #{timestamp}:master -f"
  system_try_and_fail "git checkout master"
  puts "******** Branch: #{timestamp} pushed to Heroku: #{@repo}"
end

def run_specs
  puts "******** Running specs"
  system_try_and_fail "bundle exec rake spec"
  # system_try_and_fail "bundle exec rake jasmine:ci"
  puts "******** All specs passing"
end

def deploy
  check_master_branch
  check_pending_changes
  set_heroku_account
  puts "******** Deploying to #{@env}"
  run_specs
  run_deploy
  puts "******** Successful deployment to #{@env}"
end

def reset_database
  system_try_and_fail "heroku pg:reset DATABASE --app=#{@app} --confirm=#{@app}"
end

def restart_app
  system_try_and_fail "heroku restart --app=#{@app}"
end

def migrate
  system_try_and_fail "heroku run rake db:migrate --app=#{@app}"
end

def seed_database
  system_try_and_fail "heroku run rake db:seed --app=#{@app}"
end

namespace :deploy do
  namespace :staging do
    desc "Reset the staging database"
    task :reset_database do
      @app = STAGING_APP
      reset_database
    end

    desc "Restart the staging app"
    task :restart_app do
      @app = STAGING_APP
      restart_app
    end

    desc "Migration the staging database"
    task :migrate do
      @app = STAGING_APP
      restart_app
    end

    desc "Seed the staging database"
    task :seed do
      @app = STAGING_APP
      seed_database
    end
  end

  namespace :production do
    desc "Reset the production database"
    task :reset_database do
      @app = PRODUCTION_APP
      reset_database
    end

    desc "Restart the production app"
    task :restart_app do
      @app = PRODUCTION_APP
      restart_app
    end

    desc "Migration the production database"
    task :migrate do
      @app = PRODUCTION_APP
      restart_app
    end

    desc "Seed the production database"
    task :seed do
      @app = PRODUCTION_APP
      seed_database
    end
  end

  desc "Deploy to Staging"
  task :staging do
    @env      = 'staging'
    @strategy = 'tag'
    @repo     = 'staging'
    deploy
  end

  desc "Deploy to Production"
  task :production do
    @env      = 'production'
    @strategy = 'branch'
    @repo     = 'production'
    deploy
  end
end