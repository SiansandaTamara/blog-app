class Comment < ApplicationRecord
  belongs_to :post, class_name: 'Post'
  belongs_to :author, class_name: 'User'

  after_save :updates_comments_counter
  def updates_comments_counter
    post.increment!(:comments_counter)
  end
end
