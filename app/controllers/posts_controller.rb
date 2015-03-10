class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  respond_to :html

  def index
    @posts = @q.result(distinct: true).paginate(:page => params[:page], :per_page => 3)
    
  end

  def search
  index
  render :index
end

  def show
    @photos = @post.photos.all
    respond_with(@post)
  end

  def new
    @post = current_user.posts.build
    respond_with(@post)
  end

  def edit
  end

  def create
    @post = current_user.posts.build(post_params)
    @post.save
    respond_with(@post)
  end

  def update
    @post.update(post_params)
    respond_with(@post)
  end

  def destroy
    @post.destroy
    respond_with(@post)
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :description, :access_info, :country, :state, :city, :postcode, :latitude, :longitude, :bedrooms, :sf_entry, :sf_bathroom, :sf_bedroom, :roll_shower, :price, :availability, :user_id, :proptype_id, :avatar, :longterm, :shortterm, :holiday, :price_info, photos_attributes: [:id,:photo])
    end
end
