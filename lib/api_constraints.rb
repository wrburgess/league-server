class ApiConstraints
  def initialize(options)
    @version = options[:version]
  end
    
  def matches? req
    @request = req
    type_matches? and version_matches?
  end

  private

  def type_matches?
    @request.headers['Accept'].include?("version=#{@version}")
  end

  def version_matches?
    @request.headers['Accept'].include?("application/vnd.league-server")
  end
end