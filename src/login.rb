require 'sinatra'
require 'json'
require 'omniauth'

module Login

    def self.included( app )

        app.get '/auth/:name/callback' do
            session[:uid] = request.env['omniauth.auth'].uid
            session[:provider] = request.env['omniauth.auth'].provider
            session[:login] = true

            user = User.find_or_create_by(uid: session[:uid], provider: session[:provider])
            user.name = request.env['omniauth.auth'].info.name
            user.token = request.env['omniauth.auth'].auth_token
            user.save

            redirect '/'
        end

        app.get '/logout' do
            session.clear
            redirect '/'
        end

    end
end