class Employment < ApplicationRecord
  has_many :users_emps, dependent: :destroy
  has_many :users, through: :users_emps

end
