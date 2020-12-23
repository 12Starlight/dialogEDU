class Comment < ApplicationRecord
  validates :body, presence: true

  belongs_to :author,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User 

  belongs_to :article,
    primary_key: :id,
    foreign_key: :article_id,
    class_name: :Article 
end