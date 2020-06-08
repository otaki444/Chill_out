class Image < ApplicationRecord
	attachment :image
	belongs_to :post, optional: true
	belongs_to :user, optional: true
end
