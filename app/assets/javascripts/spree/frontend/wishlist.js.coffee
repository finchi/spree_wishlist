Spree.ready ($) ->
	$('.new_wished_product').on 'submit', (form) ->
		source_form = $($(form.currentTarget).data('source'))
		selected_variant_id = source_form.find('.variants input[type=radio]:checked').val()
		$(form.currentTarget).find('#wished_product_variant_id').val selected_variant_id if selected_variant_id

	$('form#change_wishlist_accessibility').on 'submit', ->
		$.post $(this).prop('action'), $(this).serialize(), null, 'script'
		false

	$('form#change_wishlist_accessibility input[type=radio]').on 'click', ->
		$(this).parent().submit()