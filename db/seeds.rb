# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require "faker"

User.create!(
  email: "admin2@therailnews.cl",
  password: "admin1",
  role: 2,
  name: "Administrador",
  phone: 0,
  age: 0)

User.create!(
  email: "user2@therailnews.cl",
  password: "user01",
  role: 0,
  name: "Usuario",
  phone: 0,
  age: 0)

Post.create!(
  image: File.open(Rails.root.join("./app/assets/images/imagen1.jpg")),
  title: "Taiwán, estrecho en tensión: Un corredor estratégico bajo la sombra de China y el comercio mundial",
  description: "Desde hace más de siete décadas, esta franja marítima se ha convertido en un área de alto riesgo, donde convergen intereses políticos y económicos a nivel global. Las recientes maniobras militares de Beijing no hacen más que acentuar la fragilidad de este espacio.",
  user_id: User.last.id)

 Post.create!(
  image: File.open(Rails.root.join("./app/assets/images/imagen2.jpg")),
  title: "Inminente recorte: Operadores financieros lanzan apuesta previo a decisión de tasa de interés esta semana",
  description: "Los analistas consultados por el Banco Central esperan que el consejo del instituto emisor se incline por una baja de 25 puntos base, para fijar la tasa rectora en 5,25%.",
  user_id: User.last.id)
