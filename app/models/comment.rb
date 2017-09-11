class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :policy

  validates :body, presence: true
end
