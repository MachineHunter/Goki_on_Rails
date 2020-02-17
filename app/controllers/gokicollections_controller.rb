class GokicollectionsController < ApplicationController
	layout "gokicollections"

	def index
		@users = current_user.goki_users
		@gokis = Goki.all
		@goki_count = current_user.gokis.all.count
		@restore_gold = Price.where(name:"restore")[0]
		@restore_thresh = Price.where(name:"restore_thresh")[0]
		@gokiadd_gold = Price.where(name:"gokiadd")[0]
		@gokiedit_gold = Price.where(name:"gokiedit")[0]
	end


	def new
		@goki = Goki.new
		@genres = Genre.all
		@gokiselection = Goki::GOKI_SELECTION
	end



	def create
		@goki = Goki.new(goki_params)
		@gokiadd_gold = Price.where(name:"gokiadd")[0]
		
		Gmove.all.each do |g|
			if @goki.img == g.goki
				@goki.movement1 = Movement.find(g.move1)
				@goki.movement2 = Movement.find(g.move2)
			end
		end

		@goki_user = GokiUser.new(user:current_user, goki:@goki)
		@genres = Genre.all
		@gokiselection = Goki::GOKI_SELECTION
		if current_user.gokis.count > 0
			current_user.gold -= @gokiadd_gold.cost
		end

		if @goki.save && @goki_user.save && current_user.save
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
		@gokiedit_gold = Price.where(name:"gokiedit")[0]
		current_user.gold -= @gokiedit_gold.cost

		Gmove.all.each do |g|
			if @goki.img == g.goki
				@goki.movement1 = Movement.find(g.move1)
				@goki.movement2 = Movement.find(g.move2)
			end
		end
		
		if @goki.save && current_user.save
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



	def ranking
		@rankers = User.all.order("max_score desc").limit(10);
	end



	def shop
		@enhances = Enhance.all

		current_enhances = UserEnhance.where(user_id:current_user.id)
		@enhancelist = []
		current_enhances.each do |value|
			@enhancelist.append(value.enhance.name)
		end

		@enhance_cost = Price.where(name:"allenhance")[0].cost
		gon.enhance_cost = Price.where(name:"allenhance")[0].cost
	end



	def buyenhance
		enhance_cost = Price.where(name:"allenhance")[0].cost
		enhance = UserEnhance.new(user_id:current_user.id, enhance_id:params[:id])
		current_user.gold -= enhance_cost

		if enhance.save && current_user.save
			redirect_to "/gokicollections/shop"
		else
			render action: "index"
		end
	end
	


	private def goki_params
		params.require(:goki).permit(:img, :name, :description, :genre_id )
	end
end
