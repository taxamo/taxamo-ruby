module Swagger

  class Configuration

    attr_accessor :format, :api_key, :username, :password, :auth_token, :scheme, :host, :base_path, :user_agent, :logger, :inject_format, :force_ending_format, :camelize_params
    
    # Defaults go in here..
    def initialize
      @format = 'json'
      @scheme = 'https'
      @host = 'api.taxamo.com'
      @base_path = ''
      @user_agent = "ruby-swagger"
      @inject_format = true
      @force_ending_format = false
      @camelize_params = false
    end

  end

end
