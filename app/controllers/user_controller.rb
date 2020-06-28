class UsersController < ApplicationController
    get '/users/signup' do  #first route to render my signup form, not processing anything or receiving params from any form
        "this is the signup route, dahhling"
        erb :'/users/signup'
    end
    post '/users/signup' do  #first route to render my signup form, not processing anything or receiving params from any form
        #process and create new object
        @user = User.create(username: params[:username], password: params[:password])
        # binding.pry
        # params.inspect
    end
end

#remember for usage in the contorller
#params[:username]
#params[:password]