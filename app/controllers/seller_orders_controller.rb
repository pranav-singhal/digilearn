class SellerOrdersController < ApplicationController
  before_action :set_seller_order, only: [:show, :edit, :update, :destroy]

  # GET /seller_orders
  # GET /seller_orders.json
  def index
    @seller_orders = SellerOrder.all
  end

  # GET /seller_orders/1
  # GET /seller_orders/1.json
  def show
  end

  # GET /seller_orders/new
  def new
    @seller_order = SellerOrder.new
  end

  # GET /seller_orders/1/edit
  def edit
  end

  # POST /seller_orders
  # POST /seller_orders.json
  def create
    @seller_order = SellerOrder.new(seller_order_params)

    respond_to do |format|
      if @seller_order.save
        format.html { redirect_to @seller_order, notice: 'Seller order was successfully created.' }
        format.json { render :show, status: :created, location: @seller_order }
      else
        format.html { render :new }
        format.json { render json: @seller_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /seller_orders/1
  # PATCH/PUT /seller_orders/1.json
  def update
    respond_to do |format|
      if @seller_order.update(seller_order_params)
        format.html { redirect_to @seller_order, notice: 'Seller order was successfully updated.' }
        format.json { render :show, status: :ok, location: @seller_order }
      else
        format.html { render :edit }
        format.json { render json: @seller_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /seller_orders/1
  # DELETE /seller_orders/1.json
  def destroy
    @seller_order.destroy
    respond_to do |format|
      format.html { redirect_to seller_orders_url, notice: 'Seller order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_seller_order
      @seller_order = SellerOrder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def seller_order_params
      params.require(:seller_order).permit(:seller_id, :product_id, :qunatity, :seller_price_per_unit)
    end
end
