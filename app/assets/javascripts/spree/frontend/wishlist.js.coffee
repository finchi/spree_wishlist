Spree.ready ($) ->
	$('#new_wished_product').on 'submit', ->
		selected_variant_id = $('#product-variants input[type=radio]:checked').val()
		$('#wished_product_variant_id').val(selected_variant_id) if selected_variant_id
		selected_option_id = $('#ad_hoc_options input[type=radio]:checked').val()
		$('#wished_product_ad_hoc_option_value_id').val(selected_option_id) if selected_option_id

		cart_quantity = $('.add-to-cart #quantity').val()
		$('#wished_product_quantity').val cart_quantity if cart_quantity

	$('form#change_wishlist_accessibility').on 'submit', ->
		$.post $(this).prop('action'), $(this).serialize(), null, 'script'
		false

	$('form#change_wishlist_accessibility input[type=radio]').on 'click', ->
		$(this).parent().submit()