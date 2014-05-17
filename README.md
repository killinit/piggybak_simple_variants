PiggybakSimpleVariants Gem (Engine)
========

Simple variant support for Piggybak. 
You define variants, you assign a variant to a product and... it's done!

This is a modified fork of piggybak_variant : https://github.com/piggybak/piggybak_variants

Install
========

In your Gemfile add `gem "piggybak_simple_variants"`

Run `bundle install`

Run `rake piggybak_simple_variants:install:migrations` in your main Rails application.
Migrate the DB `rake db:migrate`

Add //= require piggybak_simple_variants/piggybak_simple_variants-application to your application.js

Add `acts_as_sellable_with_simple_variants` to any model. You may need to add appropriate attr_accessible settings in your model as well, depending on your attribute accessibility settings.

In the admin, define option configurations and option values for each option, then create variants. Finaly, attribue a variant to your sellable instances. A variant could be attributed to many sellable instances and dynamically.

Finally, add `<%= variant_cart_form(@instance) %>` to your sellable item's show page to render the cart form. To use dropdowns instead of radio buttons, call `<%= variant_cart_form(@instance, :controls => 'dropdowns') %>`

Copyright
========

Copyright (c) 2014 Ludovic Jamet & End Point. See LICENSE for further details.