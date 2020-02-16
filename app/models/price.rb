class Price < ApplicationRecord
	validates :name, :cost, presence:true
end
