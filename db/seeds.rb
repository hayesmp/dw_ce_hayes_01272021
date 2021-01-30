# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

[
  ['Bluetooth Mouse', 'A bluetooth mouse.', 100],
  ['Bluetooth Keyboard', 'A bluetooth keyboard.', 50],
  ['Multisync Monitor', 'An antiquated Mitsubishi CRT monitor', 4],
  ['Ryzen 7 PC', 'The latest in AMD performance.', 1]
].each do |product|
  sku = SecureRandom.alphanumeric(6)
  Product.create_with(
    description: product[1],
    sku: sku,
    quantity: product[2]
  ).find_or_create_by(name: product[0])
end
