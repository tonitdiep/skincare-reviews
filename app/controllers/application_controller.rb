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

    def product_finds
      @product_finds = Product.find_by(id: params[:id])
    end  

    def is_authorized?
      logged_in? && current_user.id == @product_finds.user_id
    #     @product_finds.update(description: params[:description], rating: params[:rating], price: params[:price], reorder: params[:reorder]) 
    #     erb :'/products/show'
    # else
    #     redirect "/products/#{product.id}"
    end
    end
    
    
  def complete_delete
    @complete_delete ||= if is_authorized?
      @product_finds.destroy
    end
  redirect '/products'
  end
end
# end
