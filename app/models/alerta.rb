class Alerta < ActiveRecord::Base
	belongs_to :empleado
	self.table_name = "alertas"

	validates :observacion, presence: { message: "no puede ser vacio"}, length: { minimum: 3, message: "debe tener minimo 3 caracteres"}, 
	 format: { with: /\A[a-zA-Z]+\z/, message: "debe ser solo letras" }

end
