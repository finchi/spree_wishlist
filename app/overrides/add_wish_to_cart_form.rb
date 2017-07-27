Deface::Override.new(
    virtual_path: 'spree/products/show',
    name: 'add_wish_to_cart_form',
    insert_bottom: "[data-hook='cart_form']",
    text: "
    <% if spree_current_user %>
      <div class='row'>
        <div id='wishlist-form' class='col-md-5 col-md-offset-6 text-right'>
          <%= render partial: 'spree/products/wishlist_form', locals: {product: @product, button: '', button_only: false} %>
        </div>
      </div>
    <% else %>
      <%= link_to 'Back', request.referer.present? ? request.referer : prodcuts_path, class: 'btn btn-default' %>
    <% end %>",
)