class Post < ApplicationRecord
  belongs_to :user
  has_many :comments

  validates :tile,
  presence: { message: "No puede estar vacío" },
  length: { in: 2..50, message: "debe tener entre 2 y 50 caracteres" }

  validates :description,
  presence: { message: "No puede estar vacío" },
  length: { in: 2..50, message: "debe tener entre 2 y 50 caracteres" }
end
