# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'bcrypt'

#Usuario Groups
grupo_usuarios = [[descripcion_grupo:"Administrador",
                   data: '{"animales":{"c":true,"m":true,"d":true},"especies":{"c":true,"m":true,"d":true},"razas":{"c":true,"m":true,"d":true},"clientes":{"c":true,"m":true,"d":true},"empleados":{"c":true,"m":true,"d":true},"usuarios":{"c":true,"m":true,"d":true},"grupos":{"c":true,"m":true,"d":true},"permisos":{"c":true,"m":true,"d":true},"horarios":{"c":true,"m":true,"d":true},"servicios":{"c":true,"m":true,"d":true},"productos":{"c":true,"m":true,"d":true},"tproductos":{"c":true,"m":true,"d":true},"lotes":{"c":true,"m":true,"d":true}}'],
               [descripcion_grupo: "Cliente"],
               [descripcion_grupo: "Empleado"]]

grupo_usuarios.each do |grupo|
  Grupo.create(grupo)
end

#Users
Usuario.create(nombre_usuario: "admin", password_digest: BCrypt::Password.create("123456"),   grupo_id: 1, state: true)
Usuario.create(nombre_usuario: "empleado", password_digest: BCrypt::Password.create("123456"),   grupo_id: 2, state: true)
Usuario.create(nombre_usuario: "secretaria", password_digest: BCrypt::Password.create("123456"),   grupo_id: 3, state: true)

personas = [
    [nombre:"Raul",ap_paterno:"Mamani",ap_materno:"Mamani",fecha_nacimiento:"02/06/1964",identificacion:2165749,correo:"raulmamani@gmail.com",direccion:"B/ Urubo calle 2",telefono:3424069,genero_id:3,persona_tipos_id:1],
    [nombre:"Mario",ap_paterno:"Antezana",ap_materno:"Gomez",fecha_nacimiento:"09/08/1976",identificacion:3142768,correo:"antezanagomez@gmail.com",direccion:"B/ Las Pampitas",telefono:3426632,genero_id:3,persona_tipos_id:2],
    [nombre:"Madeley",ap_paterno:"Holguin",ap_materno:"Escobar",fecha_nacimiento:"03/11/1992",identificacion:8818836,correo:"madeleyholguin@hotmail.com",direccion:"B/ Claracuta",telefono:72121055,genero_id:4,persona_tipos_id:1],
    [nombre:"Daniel",ap_paterno:"Coca",ap_materno:"Calvimontes",fecha_nacimiento:"04/04/1991",identificacion:8243560,correo:"danielcoca@ghotmail.com",direccion:"B/ Las margaritas",telefono:72154678,genero_id:3,persona_tipos_id:2],
    [nombre:"Luiz",ap_paterno:"Zeballos",ap_materno:"Perez",fecha_nacimiento:"21/09/1990",identificacion:8912459,correo:"Zeballitos123@hotmail.com",direccion:"B/ La Colorada",telefono:72134567,genero_id:3,persona_tipos_id:2],
    [nombre:"Alejandra",ap_paterno:"Pedraza",ap_materno:"Panoso",fecha_nacimiento:"11/07/1992",identificacion:7890654,correo:"alepegraza_123@hotmail.com",direccion:"Villa primero de mayo",telefono:76346790,genero_id:4,persona_tipos_id:1]
]

personas.each do |persona|
  Persona.create(persona)
end

animales = [
    [nombre:"Balu", alto: 40, largo: 60, peso: 10, fecha_nacimiento: "20/08/2012", fecha_deceso:"" ,genero_id:1, raza_id: 1 ,cliente_id: 3],
    [nombre:"Mufasa", alto: 35, largo: 20, peso: 7, fecha_nacimiento: "20/06/2009", fecha_deceso:"" ,genero_id:1, raza_id: 1 ,cliente_id: 4],
    [nombre:"Chuchin", alto: 20, largo: 30, peso: 4, fecha_nacimiento: "07/06/2009", fecha_deceso:"" ,genero_id:1, raza_id: 1 ,cliente_id: 3],
    [nombre:"Manchas", alto: 40, largo: 60, peso: 8, fecha_nacimiento: "10/10/2002", fecha_deceso:"23/11/2012" ,genero_id:1, raza_id: 1 ,cliente_id:5],
    [nombre:"Keila", alto: 25, largo: 40, peso: 4, fecha_nacimiento: "20/08/2015", fecha_deceso:"" ,genero_id:2, raza_id: 3 ,cliente_id: 5]

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

raza = [
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

persona_tipos = [
    [tipo:"Cliente"],
    [tipo:"Gerente"],
    [tipo:"Doctor"],
    [tipo:"Enfermero"],
    [tipo:"Vendedor"],
    [tipo:"Cajero"],
    [tipo:"Proveedor"],
    [tipo:"Limpieza"]
]
persona_tipos.each do |persona_tipos|
  PersonaTipo.create(persona_tipos)
end

servicios=[
    [nombre_servicio:"Consulta Externa",descripcion_servicio:"Consulta para un diagnostico posterior"],
    [nombre_servicio:"Pet Shop",descripcion_servicio:"Venta de accesorio para animales"],
    [nombre_servicio:"Peluqueria",descripcion_servicio:"servicios de belleza"],
    [nombre_servicio:"Internacion",descripcion_servicio:"En caso de gravedad se procedera a la internacion"],
    [nombre_servicio:"Cirugia",descripcion_servicio:"Caso extremo designado por el doctor si es necesario"],
]
servicios.each do |servicios|
  Servicio.create(servicios)
end

lotes = [
    [lote:"Anestesico",cantidad_lote:100,cantidad_minima:7],
    [lote:"Atitoxina",cantidad_lote:100,cantidad_minima:7],
    [lote:"Biotecnologia",cantidad_lote:100,cantidad_minima:7],
    [lote:"Bacterina",cantidad_lote:100,cantidad_minima:7],
    [lote:"Desinfectante",cantidad_lote:100,cantidad_minima:7],
    [lote:"Antibiotico",cantidad_lote:100,cantidad_minima:7],
    [lote:"Alimenticio",cantidad_lote:100,cantidad_minima:7],
    [lote:"Accesorio",cantidad_lote:100,cantidad_minima:7]
]
lotes.each do |lote_actual|
  Lote.create(lote_actual)
end

proveedors =[
    [nombre_proveedor:"Biofarma",direccion:"3er anillo entre Paragua y Mutualista",email:"biofarma@live.com",telefono:3400009]
]

proveedors.each do |proveedors|
  Proveedor.create(proveedors)
end

productos_tipos =[
    [nombre_tipo_producto:"Medicamentos"],
    [nombre_tipo_producto:"Alimentario"],
    [nombre_tipo_producto:"Accesorio"],
]

productos_tipos.each do |producto_tipo|
  ProductoTipo.create(producto_tipo)
end

productos = [
    [marca_producto:"Eucanoba",nombre_producto:"Alimento Balanceado",precio_total:500,fecha_vencimiento:"20/09/2020",producto_tipo_id:2,lotes_id:7],
    [marca_producto:"Purina Dog Chow",nombre_producto:"Alimento Balanceado",precio_total:400,fecha_vencimiento:"20/09/2020",producto_tipo_id:2,lotes_id:7],
    [marca_producto:"Royal Canin",nombre_producto:"Alimento Balanceado",precio_total:450,fecha_vencimiento:"20/09/2020",producto_tipo_id:2,lotes_id:7],
    [marca_producto:"CatCan",nombre_producto:"Alimento Balanceado",precio_total:180,fecha_vencimiento:"20/09/2020",producto_tipo_id:2,lotes_id:7],
    [marca_producto:"Julius",nombre_producto:"Correa Reforzada",precio_total:40,fecha_vencimiento:"",producto_tipo_id:3,lotes_id:8],
    [marca_producto:"FerPlas",nombre_producto:"Correa Simple",precio_total:30,fecha_vencimiento:"",producto_tipo_id:3,lotes_id:8],
    [marca_producto:"Biofarma",nombre_producto:"Cefalina",precio_total:3,fecha_vencimiento:"30/03/2017",producto_tipo_id:1,lotes_id:6],
    [marca_producto:"Biofarma",nombre_producto:"Gentamicina",precio_total:1.2,fecha_vencimiento:"30/05/2018",producto_tipo_id:1,lotes_id:6],
    [marca_producto:"Biofarma",nombre_producto:"Panvermix",precio_total:3,fecha_vencimiento:"10/03/2016",producto_tipo_id:1,lotes_id:4],
    [marca_producto:"Biofarma",nombre_producto:"Ibomex",precio_total:10,fecha_vencimiento:"10/03/2016",producto_tipo_id:1,lotes_id:4],
    [marca_producto:"Biofarma",nombre_producto:"Lidocaina",precio_total:12,fecha_vencimiento:"10/03/2016",producto_tipo_id:1,lotes_id:1],
    [marca_producto:"Biofarma",nombre_producto:"ketamina",precio_total:7,fecha_vencimiento:"10/03/2016",producto_tipo_id:1,lotes_id:1],
]

productos.each do |productos|
  Producto.create(productos)
end

#Genero
Genero.create(genero: "Macho")
Genero.create(genero: "Hembra")
Genero.create(genero: "Hombre")
Genero.create(genero: "Mujer")
