class ProductsController < ApplicationController
  
    get '/products' do 
        if logged_in? 
            @products = Product.all
            erb :'/products/index'
        else
            redirect '/'
        end 
    end

    get '/products/new' do
        erb :'/products/new'
    end
    
    post '/products' do 
        ### don't create if no description is included
    
        @product = current_user.products.create(params)
        @product.reorder = true if params[:reorder] == "yes"
        @product.reorder = false if params[:reorder] == "no"
        @product.save
        redirect "/products/#{@product.id}"
    end
   
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
            redirect '/products'
        end
    end   
   
    patch '/products/:id' do
        product_finds
        if is_authorized?
        # if logged_in? && current_user.id == @product_finds.user_id
            @product_finds.update(description: params[:description], rating: params[:rating], price: params[:price], reorder: params[:reorder]) 
            erb :'/products/show'
        else
            redirect "/products/#{product.id}"
        end
    end
    
    delete '/products/:id' do
        product_finds
        complete_delete
        # @product = Product.find(params[:id])
        # if !!product_user_checks
        # if logged_in? && current_user.id == @product_finds.user_id
       
        # if is_authorized?
        #     @product_finds.destroy
        # end
        # redirect '/products'  
    
    end
end