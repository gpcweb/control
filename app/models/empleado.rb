class Empleado < ActiveRecord::Base
	 has_many :alertas
	 belongs_to :perfil

	 has_secure_password

	 validates :nombres, presence: { message: "no puede ser vacio"}, length: { minimum: 3, message: "debe tener minimo 3 caracteres"}, 
	 format: { with: /\A[a-zA-Z]+\z/, message: "debe ser solo letras" }
	 validates :apellidos, presence: { message: "no puede ser vacio"}, length: { minimum: 3, message: "debe tener minimo 3 caracteres"}, 
	 format: { with: /\A[a-zA-Z]+\z/, message: "debe ser solo letras" }
	 validates :email, presence: { message: "no puede ser vacio"}, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: "no es valido" },
	 uniqueness: { message: "ya existe" }
	 validates :rut, presence: { message: "no puede ser vacio"},  uniqueness: { message: "ya existe" }
	 
end
