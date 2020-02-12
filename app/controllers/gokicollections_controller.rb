class GokicollectionsController < ApplicationController
	layout "gokicollections"

	def index
		@user = current_user.goki_user
		@gokis = Goki.all
	end

	def new
		console
		@goki = Goki.new
		@goki.user << current_user
		@genres = Genre.all
		@gokiselection = ["bossgoki", "facegoki", "goki", "mildgoki", "turkishgoki", "coolgoki", "germangoki", "greengoki", "minigoki", "stripegoki", "whitegoki"]
	end

	def create
		console
		@goki = Goki.new
		@goki.user << current_user
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
		@gokiselection = ["bossgoki", "facegoki", "goki", "mildgoki", "turkishgoki", "coolgoki", "germangoki", "greengoki", "minigoki", "stripegoki", "whitegoki"]
	end

	def update
		@goki = Goki.find(params[:id])
		@genres = Genre.all
		@goki.update(gokis_params)
		redirect_to "/gokicollections"
	end

	def destroy_all
		checked_data = params[:check].keys
		if(Goki.destroy(checked_data))
			redirect_to "/gokicollections"
		else
			render action: "index"
		end
	end


	#private def gokis_params
	#	params.require(:goki).permit(:img, :name, :description, :genre_id )
	#end
end
