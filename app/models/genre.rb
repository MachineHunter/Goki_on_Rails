class Genre < ApplicationRecord
	has_many :goki

	validates :name, presence: {message: 'must not be empty.'}
end
