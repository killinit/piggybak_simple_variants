module PiggybakSimpleVariants
  class Variant < ActiveRecord::Base
    has_many :piggybak_sellables, class_name: "Piggybak::Sellable"
    has_many :variant_options
    has_many :option_values, through: :variant_options, class_name: "::PiggybakSimpleVariants::OptionValue"
  end
end
