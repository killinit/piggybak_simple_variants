
SELECT DISTINCT piggybak_simple_variants_options.name, piggybak_simple_variants_option_values.name
FROM (((piggybak_simple_variants_options) 
INNER JOIN piggybak_simple_variants_option_values 
	ON piggybak_simple_variants_option_values.option_id = piggybak_simple_variants_options.id)
INNER JOIN piggybak_simple_variants_variant_options
	ON piggybak_simple_variants_variant_options.option_value_id = piggybak_simple_variants_option_values.id)
INNER JOIN piggybak_simple_variants_variants
	ON piggybak_simple_variants_variant_options.variant_id = piggybak_simple_variants_variants.id
WHERE piggybak_simple_variants_variants.klass = "Photograph"
ORDER BY piggybak_simple_variants_options.name DESC

PiggybakSimpleVariants::Option.select(" DISTINCT piggybak_simple_variants_options.name AS option_name, piggybak_simple_variants_option_values.name AS option_value_name").joins(:option_values => [:variant_options => :variant]).where("piggybak_simple_variants_variants.klass = 'Photograph'")


Je veux les options et les options values de tous les variants pour un objet donné groupé par optionsnd


{
	<PiggybakSimpleVariants::Option id: 2, name: "Taille", position: 2, created_at: "2014-05-13 20:22:25", updated_at: "2014-05-13 20:22:25">
		=>[
			<PiggybakSimpleVariants::OptionValue id: 4, option_id: 2, name: "Petit", position: 1, created_at: "2014-05-13 20:22:25", updated_at: "2014-05-13 20:22:25">,
			<PiggybakSimpleVariants::OptionValue id: 7, option_id: 2, name: "Très grand", position: 4, created_at: "2014-05-13 20:22:25", updated_at: "2014-05-13 20:22:25">
		], 
	<PiggybakSimpleVariants::Option id: 1, name: "Papier", position: 1, created_at: "2014-05-13 20:21:39", updated_at: "2014-05-13 20:21:39">
		=>[
			<PiggybakSimpleVariants::OptionValue id: 3, option_id: 1, name: "Satin", position: 2, created_at: "2014-05-13 20:21:39", updated_at: "2014-05-13 20:21:39">
	]
}
