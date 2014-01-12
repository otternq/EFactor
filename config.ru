require 'bundler'  

Bundler.require

set :static, true
set :public_folder, 'public'

require './src/main.rb'

run Login
run MainController