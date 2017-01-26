Deface::Override.new(
  virtual_path: 'spree/products/show',
  name: 'add_wish_to_cart_form',
  insert_bottom: "[data-hook='cart_form']",
  text: "<%= render partial: 'spree/products/wishlist_form', locals: { product: @product } %>",
)
