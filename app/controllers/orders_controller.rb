class OrdersController < ApplicationController
  before_action :set_post, only:[:new, :create]

  def new
  	@order = @post.orders.new
  end

  def create
  	
  	@order = @post.orders.new(order_params)

  	if @order.save
  		flash[:success] = "Thanks for making the enquiry, the host will be in touch soon!"
  		redirect_to root_path

  	else
  		flash[:error] = "Oops, try again!"
  		render :new
  	end
  end

  def show
  end

end

   private

    def set_post
      @post = Post.find(params[:post_id])
    end

    def order_params
  	params.require(:order).permit(:name, :email, :start_date, :end_date)
  	end