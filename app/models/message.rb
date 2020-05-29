class Message < ApplicationRecord
	validates :message, presence: true, length: { maximum: 200 }
	belongs_to :user
	belongs_to :room
end
