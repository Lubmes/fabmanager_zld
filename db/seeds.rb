# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

unless User.exists?(email: "admin@fabmanager.com")
  User.create!(email: "admin@fabmanager.com", password: "password", admin: true)
end

unless Machine.exists?(name: "Ultimaker Original")
  Machine.create(name: "Ultimaker Three")
  Machine.create(name: "Ultimaker Original Plus")
  Machine.create(name: "Ultimaker Two")
  Machine.create(name: "Ultimaker Two Plus")
  Machine.create(name: "Lasersnijder")
  Machine.create(name: "Vinylsnijder")
  Machine.create(name: "3D Scanner")
end

unless Program.exists?(name: "Adobe Illustrator")
  Program.create(name: "Adobe Illustrator")
  Program.create(name: "Tinkercad")
  Program.create(name: "Sketchup")
  Program.create(name: "Inkscape")
  Program.create(name: "Blender")
end

unless Material.exists?(sort: "multiplex")
  Material.create(sort: "multiplex", thickness: 3)
  Material.create(sort: "multiplex", thickness: 4)
  Material.create(sort: "multiplex", thickness: 6)
  Material.create(sort: "plexiglas", name: "Transparant", thickness: 3)
  Material.create(sort: "plexiglas", name: "Transparant", thickness: 5)
  Material.create(sort: "plexiglas", name: "Transparant", thickness: 10)
  Material.create(sort: "plexiglas", name: "Transparant", thickness: 15)
  Material.create(sort: "plexiglas", name: "Wit", thickness: 3)
  Material.create(sort: "plexiglas", name: "Wit", thickness: 5)
  Material.create(sort: "plexiglas", name: "Blauw", thickness: 3)
  Material.create(sort: "plexiglas", name: "Geel", thickness: 3)
  Material.create(sort: "plexiglas", name: "Transparant groen", thickness: 3)
  Material.create(sort: "plexiglas", name: "Transparant rood", thickness: 3)
  Material.create(sort: "karton")
  Material.create(sort: "karton", name: "Golf")
  Material.create(sort: "vinyl")
  Material.create(sort: "folie")
  Material.create(sort: "PLA")
end