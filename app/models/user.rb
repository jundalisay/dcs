class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :educations
  has_many :employments

  def self.text_search(query)
    if query.present?
      where("username @@ :q or email @@ :q", q: query)
    end
  end

end
