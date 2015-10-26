# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'bcrypt'

#Usuario Groups
#grupo_usuarios = ["Administrador",
#               "Cliente",
#               "Empleado",
#               "Grupo 1",
#               "Grupo 2",
#               "Grupo 3",]

#grupo_usuarios.each do |user|
#  Group.create(group_name: user)
#end

#Template
#templates = ["Inventario",
#             "Categorias de inventario",
#             "Administracion de usuarios",
#             "Bitacora",
#             "Reportes",
#             "Empleados",
#             "Pacientes"]

#templates.each do |template|
#  Template.create(template_name: template)
#end

#Group Templates
#group_templates = [
#    [1, 1, true, true, true, true],
#    [2, 1, true, true, true, true],
#    [3, 1, true, true, true, true],
#    [4, 1, true, true, true, true],
#    [5, 1, true, true, true, true],
#    [6, 1, true, true, true, true],
#    [7, 1, true, true, true, true],
#    [1, 2, false, false, false, false],
#    [2, 2, false, false, false, false],
#    [3, 2, false, false, false, false],
#    [4, 2, false, false, false, false],
#    [5, 2, false, false, false, false],
#    [6, 2, false, false, false, false],
#    [7, 2, false, false, false, false],
#    [1, 3, false, false, true, false],
#    [2, 3, false, false, false, false],
#    [3, 3, false, false, false, false],
#    [4, 3, false, false, false, false],
#    [5, 3, false, false, false, false],
#    [6, 3, false, false, false, false],
#    [7, 3, true, true, true, false],
#]
#group_templates.each do |index, group, write, modify, read, delete|
#  Grouptemplate.create(templates_id: index, groups_id: group, permission_write: write, permission_modify: modify, permission_read: read, permission_delete: delete)
#end

#Product Types
#product_types = ["Medicamentos",
#                 "Higiene",
#                 "Alimentacion",
#                 "Vestimenta",
#                 "Accesorios"]
#product_types.each do |item|
#  ProductType.create(product_type_description: item)
#end

#People
#Person.create(person_name: "YOUR NAME", person_father_last_name: "FATHER LASTNAME", person_mother_last_name: "MOTHER LAST NAME", person_address: "YOUR HOME", person_phone: 1234556, person_identity_number: 888888, user_id: 1)
#Person.create(person_name: "YOUR NAME", person_father_last_name: "FATHER LASTNAME", person_mother_last_name: "MOTHER LAST NAME", person_address: "YOUR HOME", person_phone: 1234556, person_identity_number: 888888, user_id: 2)
#Person.create(person_name: "YOUR NAME", person_father_last_name: "FATHER LASTNAME", person_mother_last_name: "MOTHER LAST NAME", person_address: "YOUR HOME", person_phone: 1234556, person_identity_number: 888888, user_id: 3)

#Admin
Usuario.create(nombre_usuario: "admin", clave: BCrypt::Password.create("123456"), email: "admin@admin.com" , group_id: 1, state: true)
Usuario.create(nombre_usuario: "client", clave: BCrypt::Password.create("123456"), email: "client@gmail.com" , group_id: 2, state: true)
Usuario.create(nombre_usuario: "employee", clave: BCrypt::Password.create("123456"), email: "employee@gmail.com" , group_id: 3, state: true)
