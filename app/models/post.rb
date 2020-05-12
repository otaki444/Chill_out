class Post < ApplicationRecord
	belongs_to :user
	has_many :likes, dependent: :destroy
	has_many :comments, dependent: :destroy
	has_many :tags, dependent: :destroy
	has_many :images, dependent: :destroy
	accepts_attachments_for :images, attachment: :image
    def favorited_by?(user)
        likes.where(user_id: user.id).exists?
    end
end
