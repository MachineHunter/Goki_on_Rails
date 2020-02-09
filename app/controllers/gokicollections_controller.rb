class GokicollectionsController < ApplicationController
	layout "gokicollections"

	def index
		@gokis = Goki.all
	end

	def new
		@goki = Goki.new
		@genres = Genre.all
		@gokiselection = ["bossgoki", "facegoki", "goki", "mildgoki", "turkishgoki", "coolgoki", "germangoki", "greengoki", "minigoki", "stripegoki", "whitegoki"]
	end

	def create
		@goki = Goki.new(gokis_params)
		@genres = Genre.all
		@gokiselection = ["bossgoki", "facegoki", "goki", "mildgoki", "turkishgoki", "coolgoki", "germangoki", "greengoki", "minigoki", "stripegoki", "whitegoki"]
		if @goki.save
			redirect_to "/gokicollections"
		else
			render "new"
		end
	end

	def edit
		@goki = Goki.find(params[:id])
		@genres = Genre.all
	end

	def update
		@goki = Goki.find(params[:id])
		@genres = Genre.all
		@goki.update(gokis_params)
		redirect_to "/gokicollections"
	end

	def destroy
		@goki = Goki.find(params[:id])
		@goki.destroy
		redirect_to "/gokicollections"
	end


	private def gokis_params
		params.require(:goki).permit(:img, :name, :description, :genre_id)
	end
end
