class Education < ApplicationRecord
  has_many :users_eds, dependent: :destroy
  has_many :users, through: :users_eds
end
