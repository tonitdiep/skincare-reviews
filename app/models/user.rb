class User < ActiveRecord::Base
    has_many :products
    has_secure_password   #login/logout/README
end 