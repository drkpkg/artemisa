# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'bcrypt'

#Usuario Groups
grupo_usuarios = ["Administrador",
               "Cliente",
               "Empleado",
               "Grupo 1",
               "Grupo 2",
               "Grupo 3",]

grupo_usuarios.each do |grupo|
  Grupo.create(descripcion_grupo: grupo)
end

#Users
Usuario.create(nombre_usuario: "admin", password_digest: BCrypt::Password.create("123456"),   grupo_id: 1, state: true)
Usuario.create(nombre_usuario: "empleado", password_digest: BCrypt::Password.create("123456"),   grupo_id: 2, state: true)
Usuario.create(nombre_usuario: "secretaria", password_digest: BCrypt::Password.create("123456"),   grupo_id: 3, state: true)

animales = [
    [nombre:"Balu", alto: 40, largo: 60, peso: 4, fecha_nacimiento: "20/08/2012", fecha_deceso:"" ,genero_id:"1", raza_id: 1 ,cliente_id: 1]
]
animales.each do |animal|
  Animal.create(animal)
end

especies = [
    [nombre_especie: "Perro"] ,
    [nombre_especie: "Gato"] ,
    [nombre_especie: "Mono"] ,
    [nombre_especie: "Loro"] ,
    [nombre_especie: "Vaca"] ,
    [nombre_especie: "Caballo"] ,
    [nombre_especie: "Tigre"] ,
    [nombre_especie: "Leon"] ,
    [nombre_especie: "Oveja"] ,
    [nombre_especie: "Cerdo"] ,
    [nombre_especie: "Serpiente"]

]
especies.each do |especie|
  Especie.create(especie)
end

raza=[
    [nombre_raza:"Criollo",especie_id:1],
    [nombre_raza:"Pastor Aleman",especie_id:1],
    [nombre_raza:"Labrador",especie_id:1],
    [nombre_raza:"Caniche",especie_id:1],
    [nombre_raza:"Chihuahueno",especie_id:1],
    [nombre_raza:"Lobo Siberiano",especie_id:1],
    [nombre_raza:"Pitbull",especie_id:1],
    [nombre_raza:"Grandanes",especie_id:1],
    [nombre_raza:"Bulldog",especie_id:1],
    [nombre_raza:"Rottweiler",especie_id:1],
    [nombre_raza:"Criollo",especie_id:2],
    [nombre_raza:"Siames",especie_id:2],
    [nombre_raza:"Persa",especie_id:2],
    [nombre_raza:"Bengala",especie_id:2],
    [nombre_raza:"Siberiano",especie_id:2],
    [nombre_raza:"Angora",especie_id:2],
    [nombre_raza:"Japones",especie_id:2],
    [nombre_raza:"Bosque de Noruega",especie_id:2],
    [nombre_raza:"Criollo",especie_id:3],
    [nombre_raza:"Hoolock",especie_id:3],
    [nombre_raza:"Gibon",especie_id:3],
    [nombre_raza:"Pongo",especie_id:3],
    [nombre_raza:"Gorila",especie_id:3],
    [nombre_raza:"Chimpance",especie_id:3],
    [nombre_raza:"Bonobo",especie_id:3],
    [nombre_raza:"Guacamayo Azul",especie_id:4],
    [nombre_raza:"Guacamayo Aliverde",especie_id:4],
    [nombre_raza:"Periquito",especie_id:4],
    [nombre_raza:"Perico Frentirojo",especie_id:4],
    [nombre_raza:"Cacatua",especie_id:4],
    [nombre_raza:"Corriente",especie_id:5],
    [nombre_raza:"Nelore",especie_id:5],
    [nombre_raza:"Holstein",especie_id:5],
    [nombre_raza:"Dexter",especie_id:5],
    [nombre_raza:"Hereford",especie_id:5],
    [nombre_raza:"Criollo",especie_id:6],
    [nombre_raza:"Arabe",especie_id:6],
    [nombre_raza:"Andaluz",especie_id:6],
    [nombre_raza:"Poni",especie_id:6],
    [nombre_raza:"Dorado",especie_id:6],
    [nombre_raza:"Bengala",especie_id:7],
    [nombre_raza:"Indochina",especie_id:7],
    [nombre_raza:"Malayo",especie_id:7],
    [nombre_raza:"Siberiano",especie_id:7],
    [nombre_raza:"Sumatra",especie_id:7],
    [nombre_raza:"Azandra",especie_id:8],
    [nombre_raza:"Leo Leo",especie_id:8],
    [nombre_raza:"Criollo",especie_id:9],
    [nombre_raza:"Texel",especie_id:9],
    [nombre_raza:"Cheviot",especie_id:9],
    [nombre_raza:"Merina",especie_id:9],
    [nombre_raza:"Criolla",especie_id:10],
    [nombre_raza:"Duroc",especie_id:10],
    [nombre_raza:"Minuatura",especie_id:10],
    [nombre_raza:"Mangalica",especie_id:10],
    [nombre_raza:"Iberico",especie_id:10],
    [nombre_raza:"Cobra",especie_id:11],
    [nombre_raza:"Piton",especie_id:11],
    [nombre_raza:"Falsa Coral",especie_id:11],
    [nombre_raza:"Anaconda",especie_id:11],
    [nombre_raza:"Boa",especie_id:11]

]

raza.each do |raza|
  Raza.create(raza)
end

empleado_tipo = [
    [cargo:"Gerente"],
    [cargo:"Doctor"],
    [cargo:"Enfermero"],
    [cargo:"Vendedor"],
    [cargo:"Cajero"],
    [cargo:"Proveedor"],
    [cargo:"Limpieza"]

]

empleado_tipos.each do |empleado_tipos|
  Empleado_tipo.create(empleado_tipo)
end


#Genero
Genero.create(genero: "Macho")
Genero.create(genero: "Hembra")
Genero.create(genero: "Hombre")
Genero.create(genero: "Mujer")