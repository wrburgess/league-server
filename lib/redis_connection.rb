class RedisConnection

  def self.close
    connection.quit
  end

  def self.connection
    @connection ||= new_connection
  end

  private

  def self.new_connection
    Redis.new(:host => AppSettings.redis_host,
              :port => AppSettings.redis_port,
              :password => AppSettings.redis_password,
              :thread_safe => true)
  end
end