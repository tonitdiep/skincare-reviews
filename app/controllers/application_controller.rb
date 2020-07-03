require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, ENV['SESSION_SECRET']
    register Sinatra::Flash
  end


  get "/" do
    #main/home page
    erb :'/welcome'
  end

  helpers do
		def logged_in?
      !!current_user
		end

		def current_user
			@current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
		end
	end


end
