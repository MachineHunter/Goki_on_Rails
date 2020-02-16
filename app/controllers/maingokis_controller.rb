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
		score = params[:gold].to_i
		current_user.gold = score + current_user.gold
		current_goki = Goki.find(params[:goki_id].to_i)
		current_goki.status = "dead"

		if score > current_user.max_score
			current_user.max_score = score
		end

		if current_user.save && current_goki.save
			redirect_to "/gokicollections"
		else
			render "index"
		end
	end
end

