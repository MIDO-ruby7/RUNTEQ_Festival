class Admin::PostsController < Admin::BaseController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show; end

  def edit; end

  def update
    if @post = Post.update(post_params)
      redirect_to admin_post_path(@post)
    else
      render :edit, status: :unprocessable_entity
    end
  end


  def import
    Admin.import(params[:file])
    redirect_to posts_path
  end

  private

  def set_post
    @post = Post.find_by(id: params[:id])
  end
end
