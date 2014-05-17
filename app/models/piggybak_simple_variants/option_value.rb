module PiggybakSimpleVariants
  class OptionValue < ActiveRecord::Base
  	has_many :variant_options
  	has_many :variants, through: :variant_options 
    belongs_to :option, :inverse_of => :option_values

    def admin_label
      "#{self.option.name}: #{self.name}"
    end

    scope :hash_ordered, -> { includes(:option).order("piggybak_simple_variants_options.position ASC, piggybak_simple_variants_option_values.position ASC") }

  end
end
