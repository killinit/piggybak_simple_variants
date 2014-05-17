module PiggybakSimpleVariantsHelper
  def variant_cart_form(object, options = {:controls => 'radio_buttons'})
    render "piggybak_simple_variants/cart/#{options[:controls]}_form", :object => object
  end

  def options_for_variant(variant)
  	PiggybakSimpleVariants::Option.select("DISTINCT piggybak_simple_variants_options.*").joins(:option_values => [:variant_options => :variant]).where("piggybak_simple_variants_variants.klass = '#{variant.klass}'")
  end

  def simple_variant_map(object)
    map = {}
    object.piggybak_sellable.each do |sellable|
      map[sellable.variant.option_values.hash_ordered.map { |ov| ov.id }.join('_')] = { :id => sellable.id, :price => number_to_currency(sellable.price) }
    end
    map.to_json
  end
end