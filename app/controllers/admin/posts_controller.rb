class Admin::PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def import
    Admin.import(params[:file])
    redirect_to posts_path
  end
end
