class ProductsController < ApplicationController
     #COMPLETE CRUD: holds the responsibilty for products
    get '/' do 
    end
    get '/products/new' do
        erb :new
    end
    post '/products' do 
        @product = Product.create(params)
        redirect "/products/@product.id"
    end

    get '/products' do 
        @products = Products.all
        erb :index 
    end

    get '/products/:id' do
        @product = Product.find(params[:id])
        erb :show
    end  
    get '/products/:id/edit' do
        @product = Product.find(params[:id])
        erb :edit
    end   
    patch '/products/:id' do
        product = Product.find_by(id: params[:id])
        product.update(description:params[:description], rating:params[:rating], price:params[:price], reorder:params[:redorder], user_id:params[:user_id]) 
        redirect "/products/#{product.id}"
    end

    delete '/products/:id' do
        @product = Product.find(params[:id])
        @product.destroy
    end
end