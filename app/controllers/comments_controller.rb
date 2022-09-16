class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @user = User.where(id: @post.author_id)
    @user.each do |user|
      @comment = @post.comments.new(text: comments_params[:text], author_id: user.id, post_id: @post.id)
    end
    redirect_to user_posts_path(id: @post.id, user_id: @post.author_id) if @comment.save
  end

  def destroy
    @comment = Comment.find(params[:id])
    authorize! :destroy, @comment

    @post = Post.find(@comment.post_id)

    flash[:success] = ['Comment Deleted Successfully']
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to "/users/#{current_user.id}/posts/#{@post.id}" }
      format.json { head :no_content }
    end
  end

  private

  def comments_params
    params.require(:comment).permit(:text, :post_id, :author_id)
  end
end
