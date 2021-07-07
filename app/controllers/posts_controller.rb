class PostsController < ApplicationController
  protect_from_forgery
  def index
    @posts = Post.all.order(created_at: :desc)
  end
  
  def new
    @posts = Post.new
  end

  def create
    @post = Post.new(content: params[:content])
    if @post.save
    redirect_to("/posts/index")
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id]) 
  end

  def update
    @post = Post.find(params[:id])
    @post.update params.require(:post).permit(:content, images: [])
    redirect_to @post
  end


  private

  def post_params
    params.require(:post).permit(:name, :images, :price, :evaluation, :description, :category_id, ).merge(user_id: current_user.id)
  end
end
