# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

noticias = []

30.times do |x|
  titulo = Faker::Name.name
  bajada = Faker::Lorem.sentence(10)
  cuerpo = Faker::Lorem.sentence(rand(300..700))
  created_at = Faker::Time.between(2.months.ago, Date.today)
  updated_at = Faker::Time.between(created_at, Date.today)
  noticias.push(title: titulo, subtitle: bajada, body: cuerpo, created_at: created_at, updated_at: updated_at)
end

New.create(noticias)
