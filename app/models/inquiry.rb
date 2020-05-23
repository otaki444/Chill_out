class Inquiry < ApplicationRecord
  	validates :email, presence: true, length: {maximum:255},
                    format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}
  	validates :message, presence: true
	validates :name, presence: true, length: { in: 2..20 }
end
