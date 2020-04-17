class Topic < ApplicationRecord
	belongs_to :user
	validates :user_id, presence: true
	validates :name, uniqueness: true
end
