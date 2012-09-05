# coding:us-ascii

require 'rack'

module GyomuRuby
  class AllYourSiteAreBelongToSsl
    def initialize(app)
      @app = app
    end

    def call(env)
      if env['HTTPS'] == 'on' || env['HTTP_X_FORWARDED_PROTO'] == 'https'
        @app.call(env)
      else
        url = Rack::Request.new(env).url.sub(/^http:/, 'https:')
        body = "<html><body>You are being <a href=\"#{url}\">redirected</a>.</body></html>"
        [301, {'Location' => url, 'Content-Type' => 'text/html'}, [body]]
      end
    end
  end
end
