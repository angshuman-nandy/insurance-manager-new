class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :policy, dependent: :destroy

  validates :body, presence: true
end
