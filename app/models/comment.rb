class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :content,
  presence: { message: "No puede estar vacío" },
  length: { in: 2..50, message: "debe tener entre 2 y 50 caracteres" }
end
