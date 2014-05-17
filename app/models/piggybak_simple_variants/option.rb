module PiggybakSimpleVariants
  class Option < ActiveRecord::Base
	has_many :option_values, -> { order(:position) }, :dependent => :destroy
	
	default_scope { order('position ASC') }
	
	accepts_nested_attributes_for :option_values, :allow_destroy => true
  end
end
