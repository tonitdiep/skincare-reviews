class User < ActiveRecord::Base
    has_many :products
    has_secure_password   #login/logout/READM
    validates :username, presence: true
    validates :username, uniqueness: true
end 