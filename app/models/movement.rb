class Movement < ApplicationRecord
	belongs_to :goki

	validates :name, presence: {message: 'must not be empty.'}
end
