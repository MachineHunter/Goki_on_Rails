class Movement < ApplicationRecord
	has_many :movement1_gokis, class_name:"Goki", foreign_key: "movement1_id"
	has_many :movement2_gokis, class_name:"Goki", foreign_key: "movement2_id"

	validates :name, :img, presence: {message: 'must not be empty.'}
end
