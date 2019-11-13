# frozen_string_literal: true

# TODO Axe in favor of content_for
# Versions of solidus >= 1.2
Deface::Override.new(virtual_path: "spree/admin/shared/_header",
                     name: "print_buttons",
                     insert_top: ".page-actions",
                     partial: "spree/admin/orders/print_buttons",
                     disabled: false)

# Versions of solidus < 1.2
# content_header was renamed in later versions and was restructured
# into _header. So only one of these will ever get applied.
Deface::Override.new(virtual_path: "spree/admin/shared/_content_header",
                     name: "print_buttons",
                     insert_top: "[data-hook='toolbar']>ul",
                     partial: "spree/admin/orders/print_buttons",
                     disabled: false)
