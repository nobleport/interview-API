class User < ApplicationRecord
    validates :username, presence: true, uniqueness: true
    validates :password, presence:true, uniqueness: true
end