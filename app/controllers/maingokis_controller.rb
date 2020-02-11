class MaingokisController < ApplicationController
	layout "maingokis"

	def index
	end

	def gindex
		@goki = Goki.find(params[:id])
	end
end

