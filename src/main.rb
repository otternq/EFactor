require 'sinatra'
require 'json'
require 'omniauth'
require 'omniauth-bitbucket'

require_relative "models/User"
require_relative "models/Day"
require_relative "models/WorkSession"
require_relative "login.rb"

class MainController < Sinatra::Base

    use Rack::Session::Cookie, :secret => 'supers3cr3t'
    use OmniAuth::Builder do
      provider :bitbucket, ENV['BITBUCKET_KEY'], ENV['BITBUCKET_SECRET']
      provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET']
    end

    configure do
      Mongoid.load!("./mongoid.yml")
    end

    include Login

    get '/' do

        if session[:login] != nil

            puts "User ID" + session[:uid]

            @user = User.find_by(uid: session[:uid], provider: session[:provider])

            @time = Time.new

            erb :main

        else
            erb :index
        end
        
    end

    post '/work/enter' do

        @user = User.find_by(uid: session[:uid], provider: session[:provider])

        @user.worksession.build(start: Time.parse(params[:start]), end: Time.parse(params[:end]), note: params[:interuption])
        @user.save

        redirect '/'

    end
end