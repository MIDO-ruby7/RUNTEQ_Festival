require 'octokit'

class OauthsController < ApplicationController
  include Rails.application.routes.url_helpers

  def oauth
    login_at(params[:provider])
  end

  def callback
    provider = params[:provider]
    if @user = login_from(provider)
      if client.organization_member?('runteq', @user.name)
      redirect_to users_path,  success: t('.success')
      else
        reset_session
        redirect_to root_path, danger: t('.fail')
      end
    else
      login_at(provider)
      begin
        # 特定の組織にユーザーが所属しているかどうかを確認する
        client = Octokit::Client.new(:access_token => ENV['GITHUB_PERSONAL_ACCESS_TOKEN'])
        @user = create_from(provider)
        if client.organization_member?('runteq', @user.name )
          reset_session
          auto_login(@user)
          redirect_to users_path,  success: t('.success')
        else
          redirect_to root_path, danger: t('.fail')
        end
      rescue
        redirect_to root_path, danger: t('.fail')
      end
    end
  end

  def destroy
    logout
    redirect_to root_path, success: t('.success')
  end
end