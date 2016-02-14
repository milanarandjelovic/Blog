class Article < ActiveRecord::Base
	has_many :comments, dependent: :destroy
	# Validates title
	validates :title, presence: true,
		length: { minimum: 5 }
	# Validates body
	validates :body,  presence: true,
		length: { minimum: 10 }
end
