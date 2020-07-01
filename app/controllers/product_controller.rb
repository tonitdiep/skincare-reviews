class ProductsController < ApplicationController
     #COMPLETE CRUD: holds the responsibilty for products
    #shows all the products
    get '/products' do 
        @products = Products.all
        erb :'/products/index' 
    end
    # new product form
    get '/products/new' do
        erb :'/products/new'
    end
    #create 1 product
    post '/products' do 
        @product = Product.create(params)
        @product[:reorder] = params[:reorder] 
        # @product.reorder = true if params[:reorder] == "yes"
        # @product.reorder = false if params[:reorder] == "no"
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
        erb :'/products/edit'
      
    end   
    #update 1 product
    patch '/products/:id' do
        product = Product.find_by(id: params[:id])
              # if statement product user.id = session[:user_id] then 
        # user can edit else etc
        product.update(description:params[:description], rating:params[:rating], price:params[:price], reorder:params[:reorder], user_id:params[:user_id]) 
        redirect "/products/#{product.id}"
    end
    # delete 1 product
    delete '/products/:id/delete' do
        @product = Product.find(params[:id])
        @product.destroy
        redirect '/products'

    end


    
end