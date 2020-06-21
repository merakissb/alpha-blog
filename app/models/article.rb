class Article < ApplicationRecord
    belongs_to :user
    has_many :article_categories
    has_many :categories, through: :article_categories

    validates :title, presence: true, length: { minimum: 6, maximum: 100}
    validates :description, presence: true, length: { minimum: 16, maximum: 2000}
    validates :avatar, presence: true
    validates :categories, presence: true
    
    has_one_attached :avatar
    has_many :comments, dependent: :destroy
end