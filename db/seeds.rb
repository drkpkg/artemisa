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
               "Empleado"]
user_groups.each do |user|
  Group.create(group_name: user)
end

#Template
templates = ["Inventario",
             "Categorias de inventario",
             "Administracion de usuarios",
             "Bitacora","Reportes",
             "Empleados",
             "Pacientes"]
templates.each do |template|
  Template.create(template_name: template)
end

#Group Templates
group_templates = [[template: 1, ]]

#Admin
User.create(username: "admin", password_digest: BCrypt::Password.create("admin"), group_id: 1)