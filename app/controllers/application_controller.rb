require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, ENV['SESSION_SECRET']
    register Sinatra::Flash
  end

    # not_found do 
    #   status 404
    #   erb :error
    # end
  # add_flash_types :danger, :info, :warning, :success

  get "/" do
    "Welcome!"
    #main/home page
    erb :'/welcome'
  end

  helpers do
		def logged_in?
      !!session[:user_id]
      
		end

		def current_user_id
			@current_user ||= User.find_by_id(session[:user_id])
		end
	end


end
