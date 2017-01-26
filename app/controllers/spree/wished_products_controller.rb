class Spree::WishedProductsController < Spree::StoreController
  respond_to :html

  def create
    @wishlist = spree_current_user.wishlist
    @wished_product = @wishlist.includes_combination?(params[:wished_product][:variant_id], params[:wished_product][:ad_hoc_option_value_id]) || @wishlist.wished_products.build(wished_product_attributes)

    if @wished_product.persisted?
      @wished_product.quantity += 1
    end

    @wished_product.save!

    respond_with(@wished_product) do |format|
      format.html { redirect_to wishlist_url(@wishlist) }
    end
  end

  def update
    @wished_product = Spree::WishedProduct.find(params[:id])
    @wished_product.update_attributes(wished_product_attributes)

    respond_with(@wished_product) do |format|
      format.html { redirect_to wishlist_url(@wished_product.wishlist) }
    end
  end

  def destroy
    @wished_product = Spree::WishedProduct.find(params[:id])
    @wished_product.destroy

    respond_with(@wished_product) do |format|
      format.html { redirect_to wishlist_url(@wished_product.wishlist) }
    end
  end

  private

  def wished_product_attributes
    params.require(:wished_product).permit(:variant_id, :ad_hoc_option_value_id, :wishlist_id, :remark, :quantity)
  end
end
