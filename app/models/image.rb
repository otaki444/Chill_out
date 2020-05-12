class Image < ApplicationRecord
	belongs_to :post
	belongs_to :user
	attachment :image
end
