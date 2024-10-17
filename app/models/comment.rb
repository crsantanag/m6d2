class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :content,
  presence: { message: "No puede estar vacío" },
  length: { in: 2..1000, message: "Debe tener entre 2 y 1000 caracteres" }
end
