class User < ApplicationRecord
  validates :username, :password_digest, :session_token, presence: true
  validates :username, uniqueness: true 
  validates :password, length: { minimum: 6, allow_nil: true }

  attr_reader :password 
  after_initialize :ensure_session_token

  has_many :articles,
    primary_key: :id,
    foreign_key: :author_id,
    class_name: :Article
end
