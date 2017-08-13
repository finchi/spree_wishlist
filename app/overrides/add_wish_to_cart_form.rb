Deface::Override.new(
    virtual_path: 'spree/products/show',
    name: 'add_wish_to_cart_form',
    insert_bottom: "[data-hook='cart_form']",
    text: "
    <div class='row'>
      <div id='wishlist-form' class='col-md-5 col-md-offset-6 text-right'>
        <% if spree_current_user %>
          <%= render partial: 'spree/products/wishlist_form', locals: {product: @product, button: '', button_only: false} %>
        <% else %>
          <%= link_to 'Back', request.referer.present? ? request.referer : root_path, class: 'btn btn-default' %>
        <% end %>
      </div>
    </div>",
)