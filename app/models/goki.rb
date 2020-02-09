class Goki < ApplicationRecord
	belongs_to :genre

	has_many :move
	validates :name, :img, presence: {message: 'must not be empty.'}
	validates :description, length: {maximum: 35, message: "must be under 35 words"}
	validates :genre_id, numericality: {only_integer:true, less_than:4, greater_than:0}
end
