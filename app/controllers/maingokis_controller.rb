class MaingokisController < ApplicationController
	layout "maingokis"

	def index
	end

	def gindex
		@goki = Goki.find(params[:id])
		@move1 = Movement.find(@goki.movement1_id)
		@move2 = Movement.find(@goki.movement2_id)
	end

	def addgold
		current_user.gold = params[:gold].to_i + current_user.gold
		if current_user.save()
			redirect_to "/gokicollections"
		else
			render "index"
		end
	end
end

