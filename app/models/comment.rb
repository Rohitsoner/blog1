class Comment < ActiveRecord::Base
	belongs_to :article
	# validates :body,:commenter presence: true,length: :data{ minimum: 5 }
  validates :body,:commenter, uniqueness: true
  validates :body, :commenter,format: {with: /\A[a-zA-Z]+\z/, message: "only allows letters"}
end
