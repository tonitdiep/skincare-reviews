class UsersController < ApplicationController
    get '/users/signup' do  #first route to render my signup form, not processing anything or receiving params from any form
        # "this is the signup route, dahhling"
        erb :'/users/signup'
    end
    post '/users/signup' do  
        #first route to render my signup form, not processing anything or receiving params from any form
        #process and create new object
        @user = User.create(username: params[:username], password: params[:password], email: params[:email])
        if @user.valid?    
            session[:user_id] = @user.id
            redirect '/products'
        else
            redirect '/users/signup'
        end
        # params.inspect
    end

    get '/users/login' do 
        # "Please login"
        erb :'/users/login'
    end

    post '/users/login' do 
        @user = User.find_by_username(params[:username])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect '/products'
        else
           flash[:message] = "Invalid Username or Password"
            redirect '/users/login'
        end
    end

    get '/users/logout' do 
        erb :'/users/logout'
    end

    post '/users/logout' do
        session.clear
        redirect to '/'
    end

end

#remember for usage in the contorller
#params[:username]
#params[:password]