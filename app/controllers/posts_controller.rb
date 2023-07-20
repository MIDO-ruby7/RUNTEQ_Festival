class PostsController < ApplicationController
  def index
    @categories = Category.all
    @selected_category_id = params[:category_id]
    @posts = filtered_posts
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  private

  def filtered_posts
    if @selected_category_id.present?
      Post.where(category_id: @selected_category_id)
    else
      Post.where(category_id: @categories.last.id)
    end
  end
end
