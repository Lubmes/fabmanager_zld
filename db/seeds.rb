# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

 User.delete_all
 Machine.delete_all
# Program.delete_all
# Material.delete_all
# License.delete_all
Fabmoment.delete_all

unless User.exists?(email: "FablabZeeland@gmail.com")
  User.create!(email: "FablabZeeland@gmail.com", password: "Z33landf@bl@b", username: "Administrator", firstname: "Alinda", lastname: "Mastenbroek", telephone: "0118 654 000", biography: "Ik ben de grote baas en administrator van het FabLab", adress: "Middelburg", admin: true)
  User.create!(email: "Gebruiker@test.com", password: "password", username: "Gebruiker", biography: "Ik ben een gewone gebruiker van het Fablab, en word op dit moment gebruikt als tester.")
end

unless Machine.exists?(name: "Ultimaker Original", capacity: 1)
  m1 = Machine.create(name: "Ultimaker Three", capacity: 1)
  m2 = Machine.create(name: "Ultimaker Original Plus", capacity: 1)
  m3 = Machine.create(name: "Ultimaker 2", capacity: 3)
  m4 = Machine.create(name: "Ultimaker 2 Plus", capacity: 2)
  m5 = Machine.create(name: "Lasersnijder", capacity: 1)
  m6 = Machine.create(name: "Vinylsnijder", capacity: 1)
  m7 = Machine.create(name: "3D Scanner", capacity: 1)
end

unless Program.exists?(name: "Adobe Illustrator")
  Program.create(name: "Adobe Illustrator")
  Program.create(name: "Tinkercad")
  Program.create(name: "Sketchup")
  Program.create(name: "Inkscape")
  Program.create(name: "Blender")
end

unless Fabmoment.exists?(title: "Fabmoment 01", description: "Test test test test test test test test test test test test test test test test test test test test test test test test test test" )
  Fabmoment.create(title: "Fabmoment 01", description: "Test test test test test test test test test test test test test test test test test test test test test test test test test test" )
  Fabmoment.create(title: "Fabmoment 02", description: "Test test test test test test test test test test test test test test test test test test test test test test test test test test" )
  Fabmoment.create(title: "Fabmoment 03", description: "Test test test test test test test test test test test test test test test test test test test test test test test test test test" )
  Fabmoment.create(title: "Fabmoment 04", description: "Test test test test test test test test test test test test test test test test test test test test test test test test test test" )
  Fabmoment.create(title: "Fabmoment 05", description: "Test test test test test test test test test test test test test test test test test test test test test test test test test test" )
  Fabmoment.create(title: "Fabmoment 06", description: "Test test test test test test test test test test test test test test test test test test test test test test test test test test" )
  Fabmoment.create(title: "Fabmoment 07", description: "Test test test test test test test test test test test test test test test test test test test test test test test test test test" )
  Fabmoment.create(title: "Fabmoment 08", description: "Test test test test test test test test test test test test test test test test test test test test test test test test test test" )
  Fabmoment.create(title: "Fabmoment 09", description: "Test test test test test test test test test test test test test test test test test test test test test test test test test test" )
  Fabmoment.create(title: "Fabmoment 10", description: "Test test test test test test test test test test test test test test test test test test test test test test test test test test" )
  Fabmoment.create(title: "Fabmoment 11", description: "Test test test test test test test test test test test test test test test test test test test test test test test test test test" )
  Fabmoment.create(title: "Fabmoment 12", description: "Test test test test test test test test test test test test test test test test test test test test test test test test test test" )
  Fabmoment.create(title: "Fabmoment 13", description: "Test test test test test test test test test test test test test test test test test test test test test test test test test test" )
  Fabmoment.create(title: "Fabmoment 14", description: "Test test test test test test test test test test test test test test test test test test test test test test test test test test" )
  Fabmoment.create(title: "Fabmoment 15", description: "Test test test test test test test test test test test test test test test test test test test test test test test test test test" )
  Fabmoment.create(title: "Fabmoment 16", description: "Test test test test test test test test test test test test test test test test test test test test test test test test test test" )
  Fabmoment.create(title: "Fabmoment 17", description: "Test test test test test test test test test test test test test test test test test test test test test test test test test test" )
  Fabmoment.create(title: "Fabmoment 18", description: "Test test test test test test test test test test test test test test test test test test test test test test test test test test" )
  Fabmoment.create(title: "Fabmoment 19", description: "Test test test test test test test test test test test test test test test test test test test test test test test test test test" )
  Fabmoment.create(title: "Fabmoment 20", description: "Test test test test test test test test test test test test test test test test test test test test test test test test test test" )
end

unless Material.exists?(sort: "Multiplex", thickness: 3)
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

unless Openingtime.exists?(title: "Openingstijden")
  Openingtime.create(title: "Openingstijden", monday: "17:00-20:00 **open inloop**", tuesday: "13:00-17:00 **open inloop** 18:00-20:00 **cursus**", wednesday: "**Alleen op afspraak**", thursday: "**Alleen op afspraak**", friday: "10:00-12:00 **cursus** 13:00-17:00 **open inloop**")
end

unless FabmanagerSettings.exists?(id: 1)
settings = FabmanagerSettings.create(id: 1, max_time_to_occupy_machine: 30*60, max_machines_to_occupy: 1, open_hour: false,)
end