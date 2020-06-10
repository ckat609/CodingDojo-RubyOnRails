class PostsController < ApplicationController
  layout 'three_column'
  def index
    @posts = Post.all.order(created_at: :desc)
    @users = User.all
  end

  def show
  end

  def create
    aPost = Post.create(title: post_params[:title], content: post_params[:content], user: User.find(post_params[:user]))

    unless aPost.valid?
      flash[:errors] = aPost.errors.full_messages
    end
    redirect_to posts_url
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :user)
  end
end
