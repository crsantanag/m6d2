# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
#
require "faker"
#
#   OBS: requiere subir imágenes
#
Post.create!(title: "En la mente de un gato", description: "Es un libro que explica de forma
simple lo que realmente se sabe de los gatos y lo mucho que falta por entender. Es un libro que
todo aquel que tenga o quiera tener un gato encontrará útil.", user_id: User.last.id)
