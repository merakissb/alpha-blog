class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :article

  validates :body, presence: true, allow_blank: false, length: { minimum: 4, maximum: 155}
end
