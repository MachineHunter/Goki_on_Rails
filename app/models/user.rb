class User < ApplicationRecord
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
	devise :database_authenticatable, :registerable,
			 :recoverable, :rememberable, :validatable

	has_many :goki_users, dependent: :destroy
	has_many :gokis, through: :goki_users
end
