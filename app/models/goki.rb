class Goki < ApplicationRecord
	belongs_to :genre
	belongs_to :movement1, class_name: "Movement", foreign_key: "movement1_id"
	belongs_to :movement2, class_name: "Movement", foreign_key: "movement2_id"
	has_many :goki_users, dependent: :destroy
	has_many :users, through: :goki_users

	validates :name, :img, presence: {message: 'must not be empty.'}
	validates :description, length: {maximum: 35, message: "must be under 35 words"}
	validates :genre_id, numericality: {only_integer:true, less_than:4, greater_than:0}

	GOKI_SELECTION = ["goki", "facegoki", "bossgoki", "mildgoki", "turkishgoki", "coolgoki", "germangoki", "greengoki", "minigoki", "stripegoki", "whitegoki"]
end
