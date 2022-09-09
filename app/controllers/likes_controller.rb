class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @like = @post.likes.new(author_id: current_user.id)
    redirect_to user_post_path(user_id: @like.author_id, id: @like.post_id) if @like.save
  end
end
