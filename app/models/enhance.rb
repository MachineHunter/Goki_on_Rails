class Enhance < ApplicationRecord
	has_many :user_enhances
	has_many :users, through: :user_enhances
end
