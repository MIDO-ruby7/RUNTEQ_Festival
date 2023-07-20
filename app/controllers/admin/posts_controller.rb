class Admin::PostsController < Admin::BaseController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all.order(id: :asc)
  end

  def show; end

  def edit; end

  def update
    if @post.update(post_params)
      redirect_to admin_posts_path, notice: t('defaults.message.success')
    else
      flash.now[:warning] = t('defaults.message.fail')
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
    redirect_to admin_posts_path
  end


  def import
    category_id = params[:category_id]
    Admin.import(params[:file], category_id)
    redirect_to admin_posts_path, notice: t('defaults.message.success')
  end

  private

  def set_post
    @post = Post.find_by(id: params[:id])
  end

  def post_params
    params.require(:post).permit(:graduating_class, :name, :app_name, :contact, :app_url, :github_url, :usage_technology, :points_for_effort, :target_users, :pain_point, :remedy, :comment, :category_id)
  end
end
