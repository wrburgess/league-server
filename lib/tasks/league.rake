namespace :league do
  task :rebuild => :environment do
    input = ''
    STDOUT.puts "Drop, recreate, and seed league app database? y[es] or n[o]"
    input = STDIN.gets.chomp
    if input == "y" && Rails.env == 'development'
      Rake::Task["db:drop"].execute
      Rake::Task["db:create"].execute
      Rake::Task["db:migrate"].execute
      Rake::Task["db:seed"].execute
      Rake::Task["db:test:prepare"].execute
    else
      puts "Aborting league:rebuild tasks"
    end
  end
end