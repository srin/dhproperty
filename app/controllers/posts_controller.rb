class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  respond_to :html

  def index
    @posts = @q.result(distinct: true)
    
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
    @photo = @post.photos.build
    respond_with(@post)
  end

  def edit
  end

  def create
    @post = current_user.posts.build(post_params)
    @post.save
    
    if params[:photos].blank?
    redirect_to @post
    flash[:success] = "Post successfully created" 
    else

      if params[:photos]['image'].each do |a|
          @photo = @post.photos.create!(:image => a, :post_id => @post.id)
       end
       redirect_to @post
       flash[:success] = "Post successfully created" 
     else
       format.html { render action: 'new' }
     end
   
    end
    
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
      params.require(:post).permit(:title, :description, :access_info, :country, :state, :city, :postcode, :latitude, :longitude, :bedrooms, :sf_entry, :sf_bathroom, :sf_bedroom, :roll_shower, :price, :availability, :user_id, :proptype_id, :image, :avatar, :longterm, :shortterm, :holiday, :price_info)
    end
end
