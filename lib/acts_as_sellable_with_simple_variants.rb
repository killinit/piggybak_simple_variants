module Piggybak
  module ActsAsSellableWithSimpleVariants
    extend ActiveSupport::Concern

    module ClassMethods
      def acts_as_sellable_with_simple_variants
        has_many :piggybak_sellable, :as => "item", :class_name => "::Piggybak::Sellable", :inverse_of => :item
        accepts_nested_attributes_for :piggybak_sellable, :allow_destroy => true
      end      
    end
  end
end

::ActiveRecord::Base.send :include, Piggybak::ActsAsSellableWithSimpleVariants