class UsersController < ApplicationController
    get '/users/signup' do  #first route to render my signup form, not processing anything or receiving params from any form
        "this is the signup route, dahhling"
        erb :'/users/signup'
    end
end