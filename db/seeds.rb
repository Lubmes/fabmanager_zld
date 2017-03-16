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

Machine.delete_all
Program.delete_all
Material.delete_all
License.delete_all

unless Machine.exists?(name: "Ultimaker Original")
  Machine.create!(name: "Ultimaker Three")
  Machine.create!(name: "Ultimaker Original Plus")
  Machine.create!(name: "Ultimaker Two")
  Machine.create!(name: "Ultimaker Two Plus")
  Machine.create!(name: "Lasersnijder")
  Machine.create!(name: "Vinylsnijder")
  Machine.create!(name: "3D Scanner")
end

unless Program.exists?(name: "Adobe Illustrator")
  Program.create(name: "Adobe Illustrator")
  Program.create(name: "Tinkercad")
  Program.create(name: "Sketchup")
  Program.create(name: "Inkscape")
  Program.create(name: "Blender")
end

unless Material.exists?(sort: "Multiplex")
  mt1 = Material.create(sort: "Multiplex", thickness: 3)
  mt2 = Material.create(sort: "Multiplex", thickness: 4)
  mt3 = Material.create(sort: "Multiplex", thickness: 6)
  mt4 = Material.create(sort: "Plexiglas", thickness: 3)
  mt5 = Material.create(sort: "Plexiglas", thickness: 5)
  mt6 = Material.create(sort: "Plexiglas", thickness: 10)
  mt7 = Material.create(sort: "Plexiglas", thickness: 15)
  mt8 = Material.create(sort: "Karton")
  mt9 = Material.create(sort: "Vinyl")
  mt10 = Material.create(sort: "Folie")
  mt11 = Material.create(sort: "PLA")
end

unless License.exists?(title:"Naamsvermelding")
  License.create(title: "Naamsvermelding", description: "Je staat anderen toe om het werk waar jij auteursrecht op 
                                                        hebt te kopiëren, distribueren, vertonen, en op te voeren, 
                                                        en om afgeleid materiaal te maken dat op jouw werk gebaseerd is – 
                                                        maar uitsluitend als jij vermeld wordt als maker.")
  License.create(title: "Naamsvermelding gelijk delen", description: "Je staat anderen toe om van jouw werk afgeleid
                                                                      materiaal te maken onder de voorwaarde dat zij 
                                                                      het onder dezelfde licentie vrijgeven als het 
                                                                      originele werk.")
  License.create(title: "Naamsvermelding niet commercieel", description: "Anderen mogen je werk kopiëren, vertonen, distribueren en opvoeren, 
                                                                          alsmede materiaal wat op jouw werk gebaseerd is, mits niet voor commerciële doeleinden.")
  License.create(title: "Naamsvermelding niet commercieel gelijk delen", description:"Anderen mogen je werk kopiëren, vertonen, distribueren en opvoeren, 
                                                                                      alsmede materiaal wat op jouw werk gebaseerd is, mits niet voor commerciële doeleinden.

                                                                                      Je staat anderen toe om van jouw werk afgeleid
                                                                                      materiaal te maken onder de voorwaarde dat zij 
                                                                                      het onder dezelfde licentie vrijgeven als het 
                                                                                      originele werk.")
  License.create(title: "Naamsvermelding geen afgeleide werken", description: " Anderen mogen je werk kopiëren, distribueren, vertonen en opvoeren mits 
                                                                                het werk in de originele staat blijft. Het is niet toegestaan dat anderen 
                                                                                jouw werk gebruiken als basis voor nieuw materiaal.")
  License.create(title: "Naamsvermelding niet commercieel geen afgeleide werken", description: "license6")
  License.create(title: "Publiek Domein", description: "license7")
end