class GokicollectionsController < ApplicationController
	layout "gokicollections"

	def index
		@users = current_user.goki_users
		@gokis = Goki.all
		@goki_count = current_user.gokis.all.count
		@restore_gold = Price.where(name:"restore")[0]
		@restore_thresh = Price.where(name:"restore_thresh")[0]
	end


	def new
		@goki = Goki.new
		@genres = Genre.all
		@gokiselection = Goki::GOKI_SELECTION
	end



	def create
		@goki = Goki.new(goki_params)
		
		Gmove.all.each do |g|
			if @goki.img == g.goki
				@goki.movement1 = Movement.find(g.move1)
				@goki.movement2 = Movement.find(g.move2)
			end
		end

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

		Gmove.all.each do |g|
			if @goki.img == g.goki
				@goki.movement1 = Movement.find(g.move1)
				@goki.movement2 = Movement.find(g.move2)
			end
		end
		
		if @goki.save
			redirect_to "/gokicollections"
		else
			render "edit"
		end
	end



	def destroy_all
		checked_data = params[:check].keys
		if(Goki.destroy(checked_data))
			redirect_to "/gokicollections"
		else
			render action: "index"
		end
	end



	def gokiexp
		@gmoves = Gmove.all
	end



	def restore
		@restore_gold = Price.where(name:"restore")[0]
		@restore_thresh = Price.where(name:"restore_thresh")[0]
		@goki = Goki.find(params[:id])
		@goki.status = "healthy"
		if current_user.gold > @restore_thresh.cost
			current_user.gold -= @restore_gold.cost
		end
		if current_user.save && @goki.save
			redirect_to "/gokicollections"
		else
			render action: "index"
		end
	end


	private def goki_params
		params.require(:goki).permit(:img, :name, :description, :genre_id )
	end
end
