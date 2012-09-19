class RedisConnection

  def self.close
    connection.quit
  end

  def self.connection
    @connection ||= new_connection
  end

  private

  def self.new_connection
    Redis.new(:host => Settings.redis.host,
              :port => Settings.redis.port,
              :password => Settings.redis.password,
              :thread_safe => true)
  end
end