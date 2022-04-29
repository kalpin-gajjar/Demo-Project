class User < ApplicationRecord
    has_many :addresses, dependent: :destroy
    accepts_nested_attributes_for :addresses
    has_one_attached :profile_pic
end
