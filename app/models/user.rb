class User < ApplicationRecord
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
	devise :database_authenticatable, :registerable,
			 :recoverable, :rememberable, :validatable
	
	has_many :goki_user, foreign_key: "user_id", dependent: :destroy
	has_many :goki, through: :goki_user
end
