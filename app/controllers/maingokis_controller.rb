class MaingokisController < ApplicationController
	layout "maingokis"

	def index
	end

	def gindex
		@goki = Goki.find(params[:id])
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

