class PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc)
  end
  
  def new
  end
 
  def create
    @post = Post.new(content: params[:content,])

    @post.save
    redirect_to("/posts/index")
  end

  def post_params
    params.require(:post).permit(
           :content, images: [])
  end
end
