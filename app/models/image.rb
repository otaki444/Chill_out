class Image < ApplicationRecord
	attachment :image
	belongs_to :post
end
