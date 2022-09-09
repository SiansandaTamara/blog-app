class CommentsController < ApplicationController
    def new
      @comment = Comment.new
    end
  
    def create
      @comment = Comment.new(comments_params)
      redirect_to user_posts_path(id: @comment.post_id, user_id: @comment.author_id) if @comment.save
    end
  
    private
  
    def comments_params
      params.require(:comment).permit(:text, :post_id, :author_id)
    end
  end
  