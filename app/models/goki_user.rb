class GokiUser < ApplicationRecord
	belongs_to :goki, optional: true
	belongs_to :user, optional: true
end
