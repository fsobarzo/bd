class WelcomeController < ApplicationController
	def index
	end

	def static
		
		
		instances = Instance.where(state: true)
		total_casos_cerrados = instances.count

		#Porcentaje uso armas
		weapons = Weapon.all
		@w_hash = Hash.new
		weapons.each do |w|
			if total_casos_cerrados == 0
				@w_hash["#{w.name}"] = "No hay casos cerrados"
			else
				@w_hash["#{w.name}"] = (w.instances.where(state: true).count / total_casos_cerrados) * 100
			end
		end

		#Porcentaje uso lugares
		places = Place.all
		@p_hash = Hash.new
		places.each do |p|
			if total_casos_cerrados == 0
				@p_hash["#{p.name}"] = "No hay casos cerrados"
			else
				@p_hash["#{p.name}"] = (p.instances.where(state: true).count / total_casos_cerrados) * 100
			end
		end

		#Promedio de horas
		sum = 0
		instances.each do |i|
			sum = sum + ((i.date_close - i.date).to_i / 1.day) * 24
		end
		@prom = sum / instances.count

		#Detective mas exitoso
		detectives = Detective.all
		@d_hash = Hash.new
		detectives.each do |d|
			@d_hash["#{d.name}"] = d.instances.where(state: true).count
		end

		casos_totales = Instance.all.count
		@porcentaje_casos_cerrados = (total_casos_cerrados / casos_totales ) * 100
	end
end
