class HomeController < ApplicationController
	before_action :authenticate_user!,except: [:seller]
	before_action :authenticate_seller!,except: [:index,:shop,:create,:all,:cart,:checkout,:payment,:confirm, :courses, :showCourse]
	 helper_method :check
  def index
  end
	def courses
		puts params
		puts "here"
		@courses=Course.where(status: 1)
	end

	def showCourse
		@course=Course.find(params[:id])
	end
  def shop
    @books= Book.all
  end
  def seller
  	@book = Book.new
  end
  def cart
    @products = Cart.where(user_id: current_user.id,status: 0)
  end
  def create
    cart=Cart.where(books_id: params["books"].to_i,status: 0)
    if cart.length==0
    @cart = Cart.new
    @cart.user_id=current_user.id
    @cart.seller_id= Book.where(id: params["books"].to_i).first.seller_id
    @cart.books_id=params["books"].to_i
    respond_to do |format|
      if @cart.save
        format.html { redirect_to '/cart', notice: 'Cart was successfully created.' }
        format.json { render :show, status: :created, location: @cart }
      else
        format.html { redirect_to "/shop",notice: 'Product already in cart' }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
    else
      redirect_to '/shop'
    end
  end
  def all
    @books = Book.all
  end
  def check
    if(UserProfile.where(user_id: current_user.id).length>0)
      return true
    else
      return false
    end
  end
  def checkout

  end
  def payment

  end
  def confirm
    if Cart.where(user_id: current_user.id,status: 0).update(status: 1)
      redirect_to '/shop'
    else
      redirect_to '/cart'
    end
  end
end
