class UsersController < ApplicationController
    get '/users/signup' do  #first route to render my signup form, not processing anything or receiving params from any form
        # "this is the signup route, dahhling"
        erb :'/users/signup'
    end
    post '/users/signup' do  
        #first route to render my signup form, not processing anything or receiving params from any form
        #process and create new object
        @user = User.create(username: params[:username], password: params[:password])
        # params.inspect
        redirect '/products'
    end

    get '/products'
        @products = Product.all
        erb :index
    end

    get '/users/login' do 
        # "Please login"
        erb :'/users/login'
    end

    post '/users/login' do 
        @user = User.create(username: params[:username], password: params[:password])
        redirect '/objects'
    end

end

#remember for usage in the contorller
#params[:username]
#params[:password]