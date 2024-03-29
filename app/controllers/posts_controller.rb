class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show, :search]


  def index
    @posts = @q.result(distinct: true).paginate(:page => params[:page], :per_page => 3)
  end

  def search
    index
    render :index
  end

  def show
  end


  def new
    @post = current_user.posts.build
  end


  def edit
  end


  def create
    @post = current_user.posts.build(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
              if params[:photos]
        
        params[:photos].each { |photo|
          @post.photo.create(photo: photo)
        }
      end
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :description, :access_info, :country, :state, :city, :postcode, :latitute, :longitude, :bedrooms, :sf_entry, :sf_bathroom, :sf_bedroom, :roll_shower, :price, :price_info, :proptype, :longterm, :shortterm, :holiday, :user_id, :avatar, :photo)
    end
end
