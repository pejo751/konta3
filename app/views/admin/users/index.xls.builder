excel_document(xml) do
	xml.Worksheet 'ss:Name' => @users.first.class.table_name do
		xml.Table do
			# Header
			xml.Row do
				xml.Cell { xml.Data 'Id', 'ss:Type' => 'String' }
				xml.Cell { xml.Data 'Login', 'ss:Type' => 'String' }
				xml.Cell { xml.Data 'Nombre', 'ss:Type' => 'String' }
				xml.Cell { xml.Data 'Email', 'ss:Type' => 'String' }
				xml.Cell { xml.Data 'Ultimo login', 'ss:Type' => 'String' }
				xml.Cell { xml.Data 'Ultima ip', 'ss:Type' => 'String' }
				xml.Cell { xml.Data 'Creación', 'ss:Type' => 'String' }
				xml.Cell { xml.Data 'Actualización', 'ss:Type' => 'String' }

			end
			# Rows
			for user in @users
				xml.Row do
					xml.Cell { xml.Data user.id, 'ss:Type' => 'Number' }
					xml.Cell { xml.Data user.login, 'ss:Type' => 'String' }
					xml.Cell { xml.Data user.nombre, 'ss:Type' => 'String' }
					xml.Cell { xml.Data user.email, 'ss:Type' => 'String' }
					xml.Cell { xml.Data user.last_login_at, 'ss:Type' => 'String' }
					xml.Cell { xml.Data user.last_login_ip, 'ss:Type' => 'String' }
					xml.Cell { xml.Data "#{user.created_at.getlocal.strftime("%d/%m/%Y %H:%M")}", 'ss:Type' => 'String' }
					xml.Cell { xml.Data "#{user.updated_at.getlocal.strftime("%d/%m/%Y %H:%M")}", 'ss:Type' => 'String' }
				end
			end
		end
	end
end
