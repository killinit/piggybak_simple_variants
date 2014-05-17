module PiggybakSimpleVariants
  class Engine < ::Rails::Engine
    isolate_namespace PiggybakSimpleVariants
   
    config.to_prepare do 
      ApplicationController.class_eval do
        helper :piggybak_simple_variants
      end
      RailsAdmin::ApplicationController.class_eval do
        helper :piggybak_simple_variants
      end
      Piggybak::Sellable.class_eval do
        belongs_to :variant, class_name: "PiggybakSimpleVariants::Variant"
        def available?
          if active && quantity > 0 || unlimited_inventory
            true
          else
            false
          end
        end
      end
    end

    config.before_initialize do
      Piggybak.config do |config|
        config.manage_classes += ["::PiggybakSimpleVariants::Option",
                                  "::PiggybakSimpleVariants::Variant",
                                  "::PiggybakSimpleVariants::VariantOption",
                                  "::PiggybakSimpleVariants::OptionValue"]
      end
    end

    initializer "piggybak_simple_variants.assets.precompile" do |app|
      app.config.assets.precompile += ['piggybak_simple_variants/piggybak_simple_variants-application.js']
    end

    # TODO: Figure out of we can have this only in to_prepare or here
    initializer "piggybak_simple_variants.add_helper" do |app|
      ApplicationController.class_eval do
        helper :piggybak_simple_variants
      end
    end

    initializer "piggybak.rails_admin_config" do |app|
      RailsAdmin.config do |config|
        config.model PiggybakSimpleVariants::OptionValue do
          visible false
          edit do
            field :name
            field :position
          end
        end

        config.model PiggybakSimpleVariants::Option do
          navigation_label "Extensions"
          list do
            field :name     
            field :position
            field :option_values
          end
          edit do
            field :name
            field :position
            field :option_values do
              active true
            end
          end
        end
        
        config.model PiggybakSimpleVariants::Variant do
          label "Define variants"
          show do
            field :name do
              visible true
            end
            field :klass
            field :option_values do
              visible true
            end
          end
          edit do
            field :name do
              active true
            end
            field :klass do
              visible :true
              help "Add the name of your class for this variant."
            end
            field :option_values do
              visible true
            end
          end
        end

        config.model PiggybakSimpleVariants::VariantOption do
          label "Options for variants"
          visible false
        end

        config.model Piggybak::Sellable do
          label "Sellable"
          visible false
          edit do
            field :sku
            field :description 
            field :price
            field :active
            field :quantity
            field :unlimited_inventory do
              help "If true, backorders on this variant will be allowed, regardless of quantity on hand."
            end
            field :variant
          end
        end
      end
    end
  end
end