class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @user_posts = Post.includes(:author, :comments, :likes).where(author_id: params[:user_id]).order(created_at: :desc)
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    @comment = Comment.new
    @like = Like.new
  end

  def new
    @post = Post.new
    @user = User.find(params[:user_id])
  end

  def create
    @user = User.find(params[:user_id])
    @post = @user.posts.new(posts_params)

    if @post.save!
      redirect_to user_post_path(id: @post.id, author_id: @post.author_id), notice: 'Post created succesfully!'
    else
      render :new, alert: 'Post could not be created an Error occurred!'
    end
  end

  private

  def posts_params
    post_hash = params.require(:post).permit(:title, :text)
    post_hash[:author] = User.find(params[:user_id])
    post_hash
  end
end
