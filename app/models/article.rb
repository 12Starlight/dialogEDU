class Article < ApplicationRecord
  validates :title, :body, presence: true
  validates :title, length: { minimum: 10, allow_nil: true }

  belongs_to :author,
    primary_key: :id,
    foreign_key: :author_id,
    class_name: :User

  has_many :comments
end