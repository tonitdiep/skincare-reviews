class ProductsController < ApplicationController
     #COMPLETE CRUD: holds the responsibilty for products
    get '/' do 
    end
    get '/products/new' do
        erb :'/products/new'
    end
    post '/products' do 
        @product = Product.create(params)
        redirect "/products/#{@product.id}"
    end

    get '/products' do 
        @products = Products.all
        erb :'/products/index' 
    end

    get '/products/:id' do
        # binding.pry
        @product = Product.find(params[:id])
        erb :'/products/show'
    end  
    get '/products/:id/edit' do
        @product = Product.find(params[:id])
        erb :'/products/edit'
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