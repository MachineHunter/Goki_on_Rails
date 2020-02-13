class GokicollectionsController < ApplicationController
	layout "gokicollections"

	def index
		@users = current_user.goki_users
		@gokis = Goki.all
	end

	def new
		@goki = Goki.new
		@genres = Genre.all
		@gokiselection = Goki::GOKI_SELECTION
	end

	def create
		@goki = Goki.new(goki_params)
		@goki_user = GokiUser.new(user:current_user, goki:@goki)
		@genres = Genre.all
		@gokiselection = Goki::GOKI_SELECTION
		if @goki.save && @goki_user.save
			redirect_to "/gokicollections"
		else
			render "new"
		end
	end

	def edit
		@goki = Goki.find(params[:id])
		@genres = Genre.all
		@gokiselection = Goki::GOKI_SELECTION
	end

	def update
		@goki = Goki.find(params[:id])
		@genres = Genre.all
		@goki.update(goki_params)
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


	private def goki_params
		params.require(:goki).permit(:img, :name, :description, :genre_id )
	end
end
