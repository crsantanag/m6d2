class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
  has_many :posts
  has_many :comments

   # Enum para definir los roles de usuario
   enum :role, { normal_user: 0, author: 1, admin: 2 }
end
