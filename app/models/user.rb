class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

	has_many :posts, dependent: :destroy
	has_many :comments, dependent: :destroy
	has_many :follow, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy
	has_many :follows, through: :follow
	has_many :follower, foreign_key: "follow_id", class_name: "Relationship", dependent: :destroy
	has_many :followers, through: :follower
	has_many :images, dependent: :destroy
	has_many :likes, dependent: :destroy
	has_many :favorites, dependent: :destroy
	has_many :messages, dependent: :destroy
  	has_many :entries, dependent: :destroy

	attachment :profile_image
	validates :name, presence: true, length: { in: 2..20 }
	validates :name_kana, presence: true, format: {with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。'}
	validates :nickname, presence: true, length: { maximum: 20 }
	validates :introduction, length: { maximum: 50 }
	validates :one_word, length: { maximum: 20 }

	def active_for_authentication?
		super && (self.come_out == false)
	end

	def following?(user)
		follow.find_by(follow_id: user)
	end
	def follow_user(user_id)
		follow.create(follow_id: user_id)
	end
	def unfollow(user_id)
		follow.find_by(follow_id: user_id).destroy
	end
end
