class ProductsController < ApplicationController
     #COMPLETE CRUD: holds the responsibilty for products
    #shows all the products
    get '/products' do 
        if logged_in? 
            @products = Product.all
            erb :'/products/index'
        else
            redirect '/'
        end 
    end
    # new product form
    get '/products/new' do
        erb :'/products/new'
    end
    #create 1 product
    post '/products' do 
        @product = current_user.products.create(params)
        # @product[:reorder] = params[:reorder] 
        @product.reorder = true if params[:reorder] == "yes"
        @product.reorder = false if params[:reorder] == "no"
        @product.save
        redirect "/products/#{@product.id}"
    end
    # show 1 product
    get '/products/:id' do
        @product = Product.find(params[:id])
        erb :'/products/show'
    end  
    #edit 1 product
    get '/products/:id/edit' do  
        @product = Product.find(params[:id])
        if logged_in? && current_user.id == @product.user_id  #setting up protection
            erb :'/products/edit'
        else
            # flash[:message] = "Write your own review on this product."
            redirect '/products'
        end
    end   
    #update 1 product
    patch '/products/:id' do
        product = Product.find_by(id: params[:id])
              # if statement product user.id = session[:user_id] then 
        # user can edit else etc
        product.update(description:params[:description], rating:params[:rating], price:params[:price], reorder:params[:reorder], user_id:current_user.id) 
        redirect "/products/#{product.id}"
    end
    # delete 1 product
    delete '/products/:id' do
        # binding.pry
        @product = Product.find(params[:id])
        if logged_in? && current_user.id == @product.user_id
            @product.destroy
            # flash[:message] = "You don't have permission."
        end
        redirect '/products'
      end  
end