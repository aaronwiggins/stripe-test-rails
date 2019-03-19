class ItemsController < ApplicationController
    def index
        @items = Item.all
      end
    
      def show
      end
    
      def new
        @seller = Seller.find(params[:seller_id])
        @item = @seller.items.build
      end
    
      def edit
        @seller = Seller.find(params[:seller_id])
        @item = Item.find(params[:id])
      end
    
      def create
        @seller = Seller.find(params[:seller_id])
        @item = @seller.items.new(item_params)
    
        if @item.save
          redirect_to seller_path(@seller)
        else
          format.html { render :new }
        end
      end
    
      def update
        set_item
        @seller = Seller.find(params[:seller_id])
        if @item.update(item_params)
          redirect_to seller_path(@seller)
        else
          format.html { render :edit }
        end
      end
    
      def destroy
        set_item
        @seller = Seller.find(params[:seller_id])
        @item.destroy
        if @item.destroyed?
          redirect_to seller_path(@seller)
        else
          redirect_to seller_path(@seller)
        end
      end
    
      private
    
      def set_item
        @item = Item.find(params[:id])
      end
    
      def set_seller
        @seller = Seller.find(params[:id])
      end
    
      def item_params
        params.require(:item).permit(:title, :description, :price, :seller_id)
      end
end
