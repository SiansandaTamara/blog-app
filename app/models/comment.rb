class Comment < ApplicationRecord
  belongs_to :post, class_name: 'Post'
  belongs_to :author, class_name: 'User'

  # validations
  validates :text, presence: true
  validates :author_id, presence: true
  validates :post_id, presence: true

  after_save :updates_comments_counter
  after_destroy :decrease_post_comment_counter

  def updates_comments_counter
    post.increment!(:comments_counter)
  end

  def decrease_post_comment_counter
    post.decrement!(:comments_counter) unless post.comments_counter.zero?
  end
end
