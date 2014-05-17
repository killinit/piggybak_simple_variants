PiggybakSimpleVariants Gem (Engine)
========

Simple variant support for Piggybak. 
You define variants, you assign a variant to a product and... it's done!

Install
========

In your Gemfile add `gem "piggybak_simple_variants"`

Run `bundle install`

Run `rake piggybak_simple_variants:install:migrations` in your main Rails application.
Migrate the DB `rake db:migrate`

Add `acts_as_sellable` to any model, variant could be used or not. You may need to add appropriate attr_accessible settings in your model as well, depending on your attribute accessibility settings.

In the admin, define option configurations and option values for each option, then create variants. Finaly, attribue a variant to your sellable instances. A variant could be attributed to many sellable instances.

Finally, add `<%= variant_cart_form(@instance) %>` to your sellable item's show page to render the cart form. To use dropdowns instead of radio buttons, call `<%= variant_cart_form(@instance, :controls => 'dropdowns') %>`

Copyright
========

Copyright (c) 2014 Ludovic Jamet & End Point. See LICENSE for further details.
