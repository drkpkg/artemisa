# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'bcrypt'

#Asset Categories
asset_categories = ["Medicamentos",
                    "Higiene",
                    "Alimentacion",
                    "Vestimenta",
                    "Accesorios"]
asset_categories.each do |item|
  AssetCategory.create(asset_category_description: item)
end

#User Groups
user_groups = ["Administrador",
               "Cliente",
               "Empleado",
               "Grupo 1",
               "Grupo 2",
               "Grupo 3",]
user_groups.each do |user|
  Group.create(group_name: user)
end

#Template
templates = ["Inventario",
             "Categorias de inventario",
             "Administracion de usuarios",
             "Bitacora",
             "Reportes",
             "Empleados",
             "Pacientes"]
templates.each do |template|
  Template.create(template_name: template)
end

#Group Templates
group_templates = [
    [1, 1, true, true, true, true],
    [2, 1, true, true, true, true],
    [3, 1, true, true, true, true],
    [4, 1, true, true, true, true],
    [5, 1, true, true, true, true],
    [6, 1, true, true, true, true],
    [7, 1, true, true, true, true],
    [1, 2, false, false, false, false],
    [2, 2, false, false, false, false],
    [3, 2, false, false, false, false],
    [4, 2, false, false, false, false],
    [5, 2, false, false, false, false],
    [6, 2, false, false, false, false],
    [7, 2, false, false, false, false],
    [1, 3, false, false, true, false],
    [2, 3, false, false, false, false],
    [3, 3, false, false, false, false],
    [4, 3, false, false, false, false],
    [5, 3, false, false, false, false],
    [6, 3, false, false, false, false],
    [7, 3, true, true, true, false],
]
group_templates.each do |index, group, write, modify, read, delete|
  Grouptemplate.create(templates_id: index, groups_id: group, permission_write: write, permission_modify: modify, permission_read: read, permission_delete: delete)
end

#People
Person.create(person_name: "YOUR NAME", person_father_last_name: "FATHER LASTNAME", person_mother_last_name: "MOTHER LAST NAME", person_address: "YOUR HOME", person_phone: 1234556, person_identity_number: 888888, user_id: 1)
Person.create(person_name: "YOUR NAME", person_father_last_name: "FATHER LASTNAME", person_mother_last_name: "MOTHER LAST NAME", person_address: "YOUR HOME", person_phone: 1234556, person_identity_number: 888888, user_id: 2)
Person.create(person_name: "YOUR NAME", person_father_last_name: "FATHER LASTNAME", person_mother_last_name: "MOTHER LAST NAME", person_address: "YOUR HOME", person_phone: 1234556, person_identity_number: 888888, user_id: 3)

#Admin
User.create(username: "admin", password_digest: BCrypt::Password.create("admin"), email: "admin@admin.com" , group_id: 1, state: true)
User.create(username: "client", password_digest: BCrypt::Password.create("client"), email: "client@gmail.com" , group_id: 2, state: true)
User.create(username: "employee", password_digest: BCrypt::Password.create("employee"), email: "employee@gmail.com" , group_id: 3, state: true)
