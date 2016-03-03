class Article < ActiveRecord::Base
	has_many :comments
	belongs_to :user
  validates :title, presence: true,length: { minimum: 5 }
  validates :title,:text, uniqueness: true
  validates :title, :text,format: {with: /\A[a-zA-Z]+\z/, message: "only allows letters"}
end
