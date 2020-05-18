class Post < ApplicationRecord
	belongs_to :user
	has_many :likes, dependent: :destroy
	has_many :favorites, dependent: :destroy
	has_many :comments, dependent: :destroy
	has_many :post_images, class_name: "Image", dependent: :destroy
	accepts_attachments_for :post_images, attachment: :image

	validates :title,    length: { maximum: 20 }
	validates :article,    length: { maximum: 100 }

	acts_as_taggable

	def add_images(params)
		params.each do |image|
	   	 new_image = Image.new(image: image)
	   	 new_image.post_id = self.id
	   	 new_image.user_id = self.user_id
	   	 return false unless new_image.save!
		end
	end

    def liked_by?(user)
        likes.where(user_id: user.id).exists?
    end

    def favorited_by?(user)
        favorites.where(user_id: user.id).exists?
    end
end


