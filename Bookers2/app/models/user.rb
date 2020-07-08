class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   validates :username, presence: true, uniqueness: true, length: { in: 2..20 }

   has_many :books, dependent: :destroy
   attachment :profile_image # user image

end
