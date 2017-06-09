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

    def update(params)
      if params[:format]
        @format = params[:format]
      end
      if params[:scheme]
        @scheme = params[:scheme]
      end
      if params[:host]
        @host = params[:host]
      end
      if params[:base_path]
        @base_path = params[:base_path]
      end
      if params[:user_agent]
        @user_agent = params[:user_agent]
      end
      if params[:inject_format]
        @inject_format = params[:inject_format]
      end
      if params[:force_ending_format]
        @force_ending_format = params[:force_ending_format]
      end
      if params[:camelize_params]
        @camelize_params = params[:camelize_params]
      end
      if params[:api_key]
        @api_key = params[:api_key]
      end
      if params[:username]
        @username = params[:username]
      end
      if params[:password]
        @password = params[:password]
      end
      if params[:auth_token]
        @auth_token = params[:auth_token]
      end
      if params[:logger]
        @logger = params[:logger]
      end
    end
  end

end
