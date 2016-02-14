class Comment < ActiveRecord::Base
	belongs_to :article
	# Validates author
	validates :author, presence: true
	# Validates body
	validates :body, presence: true
end
