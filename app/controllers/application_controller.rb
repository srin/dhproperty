class ApplicationController < ActionController::Base
	before_filter :list_posts
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

    def list_posts
  	@q = Post.ransack(params[:q])
  end
end
