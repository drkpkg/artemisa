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

#Species
#Especie.create()