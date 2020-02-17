class UserEnhance < ApplicationRecord
	belongs_to :enhance, optional: true
	belongs_to :user, optional: true
end
