class User < ApplicationRecord
  has_many :posts, class_name: 'post'
  has_many :comments, class_name: 'Comment'
  has_many :likes, class_name: 'Like'

  # validations
  validates :name, presence: true
  validates :posts_counter, numericality: { only_integer: true, greater_than: 0 }

  def recent_posts
    posts.limit(3).order(created_at: :desc)
  end
end
