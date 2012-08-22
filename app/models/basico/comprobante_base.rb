# -*- encoding : utf-8 -*-
class Basico::ComprobanteBase < Basico::ClaseBase

	self.abstract_class = true

	attr_accessor :nombre_tipo, :set_nombre_tipo, :titular, :debito, :credito

	validates_presence_of :tipo, :fecha, :message => "no puede estar vacío."

	before_save :completa_datos

	def after_initialize
		super
		campos = self.class.column_names
		if set_default
			self.centro = 0 if campos.include?('centro')
			self.numero = 0 if campos.include?('numero')
			self.fecha = Date.current if campos.include?('fecha')
			self.total = 0.00 if campos.include?('total')
			self.cuit = 0 if campos.include?('cuit')
		end
		if !new_record?
			self.fecha = fecha if campos.include?('fecha')
		end
	end

	def completa_datos
		self.numero = case
			when tipo.nil? then 0
			when numero.to_i > 0 then numero.to_i
			when (ultimo = self.class.find(:last,
				:conditions => ['tipo = ?', tipo], :order => 'numero')) then ultimo.numero + 1
			else 1
		end
		campos = self.class.column_names
		self.nombre_tipo = nombre_tipo if campos.include?('nombre_tipo')
		set_total if campos.include?('total')
	end

	def to_s(con_ceros = nil)
		!con_ceros ?
			"#{tipo}-#{centro}-#{numero}-#{fecha}" :
			"#{tipo} #{"%04d" % centro} #{"%08d" % numero} #{fecha}"
	end

	def to_humano
		self.class.to_s.underscore.humanize + ' ' + to_s(true)
	end

	def self.to_select
		all(:order => 'fecha DESC').collect {|c| [c.to_s, c.id]}
	end

end
