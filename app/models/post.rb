class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :restrict_with_error
  has_one_attached :image

  validates :title,
  presence: { message: "No puede estar vacío" },
  length: { in: 2..1000, message: "debe tener entre 2 y 1000 caracteres" }

  validates :description,
  presence: { message: "No puede estar vacío" },
  length: { in: 2..1000, message: "debe tener entre 2 y 1000 caracteres" }

  validate :image_size_validation

  private

  def image_size_validation
    if image.attached? && image.blob.byte_size > 1.megabyte
      errors.add(:image, "La imagen es demasiado grande. El tamaño máximo permitido es 1 MB.")
    end
  end
end
