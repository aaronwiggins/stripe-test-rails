class SellersController < ApplicationController
    before_action :set_seller, only: [:show, :edit, :update, :destroy]

  def index
    @user = current_user
    @sellers = Seller.all
  end

  def show
    @user = current_user
    @items = @seller.items.all
    @transaction = @user.transactions.build
  end

  def new
    @user = current_user
    @seller = @user.sellers.build
  end

  def create
    @user = current_user
    @seller = @user.sellers.new(seller_params)

    if @seller.save
      redirect_to sellers_path
    else
      format.html { render :new }
    end
  end

  def update
    if @seller.save
      redirect_to sellers_path
    else
      format.html { render :new }
    end
  end

  def destroy
    @seller.destroy
    respond_to do |format|
      format.html { redirect_to sellers_url, notice: 'seller was successfully destroyed.' }
    end
  end

  private

  def set_seller
    @seller = Seller.find(params[:id])
  end

  def set_user
    @user = current_user
  end

  def seller_params
    params.require(:seller).permit(:title, :description, :user_id)
  end
end
