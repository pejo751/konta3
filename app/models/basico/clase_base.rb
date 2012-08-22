# -*- encoding : utf-8 -*-
class Basico::ClaseBase < ActiveRecord::Base

	self.abstract_class = true

	attr_accessor :set_default, :auditoria
	cattr_reader :per_page
	@@per_page = 10

	validate :valida_tipos

	def after_initialize
		if set_default
		end
		if !self.new_record?
			self.created_at = created_at unless attributes['created_at'].nil?
			self.updated_at = updated_at unless attributes['updated_at'].nil?
		end
	end

	def valida_tipos
		self.class.columns.each do |c|
			before = send("#{c.name}_before_type_cast").to_s
			next if c.name == 'id'
			case c.type
				when :date
					next if before.blank?
					begin
						f = Date.strptime(before, '%d/%m/%Y')
					rescue
						errors.add("#{c.name}".to_sym, 'inválida, debe ser formato "DD/MM/AAAA"')
					else
						send("#{c.name}=", f)
					end
				when :integer, :float, :decimal
					unless c.name =~ /_id/
						errors.add("#{c.name}".to_sym, 'debe ser un número.') unless before =~ /^\d+|\d+.\d+$/
					end
			end
		end
	end
	
	def auditoria
		if defined?(fec_grab)
			"<b>Fec:</b>#{fec_grab} <b>Hor:</b>#{hor_grab} 
				<b>Usr:</b>#{usr_grab} <b>Wks:</b>#{wks_grab} <b>Ope:</b>#{tip_grab}"
		elsif defined?(created_at) and !created_at.nil?
			"<b>Creación:</b> #{created_at} - <b>Actualización:</b> #{updated_at}"
		end
	end

	def class_to_s
		self.class.to_s.underscore
	end

	def class_to_humano
		self.class.to_s.underscore.humanize
	end

	def url_recurso
		'/'+self.class.table_name
	end

end
