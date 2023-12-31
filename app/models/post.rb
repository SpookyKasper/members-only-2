class Post < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :message, length: { minimum: 10 }
end
