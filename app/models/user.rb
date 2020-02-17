class User < ApplicationRecord
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
	devise :database_authenticatable, :registerable,
			 :recoverable, :rememberable, :validatable
	
	has_many :goki_users, foreign_key: "user_id", dependent: :destroy
	has_many :gokis, through: :goki_users

	has_many :user_enhances
	has_many :enhances, through: :user_enhances

	attribute :gold, default: 0
	attribute :max_score, default: 0
end
