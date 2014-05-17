var piggybak_simple_variants = {
	refreshControls : function(data) {
		if(data.all_selected) { // if all selected
			var selected_key = data.selected.sort(function (a, b) { return a - b }).join('_');
			console.log(selected_key);
			if(simple_variant_map[selected_key]) {
				$('.simple_variant_options form').show();
				$('#sellable_id').val(simple_variant_map[selected_key].id);
				$('#variant_price span').html(simple_variant_map[selected_key].price);
			} else { // if variant not available
				$('.simple_variant_options form').hide();
				$('.unavailable').show();
			}
		} else { // if not all selected
			$('.all_selected').show();
			$('.simple_variant_options form').hide();
		}
	},
	extractRadioButtonValues: function() {
		var all_selected = true;
		var selected = new Array();
		$.each($('.option'), function(i, j) {
			var option_id = $(j).attr('id');
			if($('input[name=' + option_id + ']:checked').length) {
				selected.push($('input[name=' + option_id + ']:checked').val());
			} else {
				all_selected = false;	
			}
		});					
		return { all_selected: all_selected, selected: selected };
	},
	toggleVariantForm: function() {
		$('.unavailable, .all_selected').hide();
		var data;
		data = piggybak_simple_variants.extractRadioButtonValues();
		piggybak_simple_variants.refreshControls(data);
	}
}

$(function() {
	$('.simple_variant_options input[type=radio]').click(function() { piggybak_simple_variants.toggleVariantForm(); });
	if($('.simple_variant_options').size() > 0) {
		piggybak_simple_variants.toggleVariantForm();
	}
});

