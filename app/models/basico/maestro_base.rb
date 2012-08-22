# -*- encoding : utf-8 -*-
class Basico::MaestroBase < Basico::ClaseBase

	self.abstract_class = true

	validates_presence_of :nombre, :if => Proc.new {|m| m.class.column_names.include?('nombre') },
		:message => "no puede estar vacío."

	def after_initialize
		super
		if set_default
			self.documento = 0 if self.class.column_names.include?('documento')
			self.cuit = 0 if self.class.column_names.include?('cuit')
			self.ciudad = 'San Miguel de Tucumán' if self.class.column_names.include?('ciudad')
			self.codigo_postal = '4000' if self.class.column_names.include?('codigo_postal')
			self.provincia = 'Tucumán' if self.class.column_names.include?('provincia')
		end
		if !new_record?
			self.cuit = self.cuit.round if self.class.column_names.include?('cuit')
			self.nacimiento = nacimiento if self.class.column_names.include?('nacimiento')
			self.fallecimiento = fallecimiento if self.class.column_names.include?('fallecimiento')
		end
	end

	def to_s
		"#{id} - #{nombre}"
	end

	def self.to_select
		all(:order => 'nombre').collect {|m| ["#{m.nombre} - #{m.id}", m.id]}
	end
	
	def direccion_to_s
		"#{direccion}\n
		#{ciudad}\n
		(#{codigo_postal})\n
		#{provincia}"
	end

end
