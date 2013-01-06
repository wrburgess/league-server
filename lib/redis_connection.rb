class RedisConnection

  def self.close
    connection.quit
  end

  def self.connection
    @connection ||= new_connection
  end

  private

  def self.new_connection
    Redis.new(:host => Settings.redis_host,
              :port => Settings.redis_port,
              :password => Settings.redis_password,
              :thread_safe => true)
  end
end