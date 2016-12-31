class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :users_eds, dependent: :destroy
  has_many :educations, through: :users_eds, dependent: :destroy

  has_many :users_emps, dependent: :destroy
  has_many :employments, through: :users_emps, dependent: :destroy

  def self.text_search(query)
    if query.present?
      where("username @@ :q or email @@ :q", q: query)
    end
  end

end
