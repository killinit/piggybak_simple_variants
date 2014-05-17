module PiggybakSimpleVariants
  class VariantOption < ActiveRecord::Base
  	belongs_to :option_value
  	belongs_to :variant
  end
end
