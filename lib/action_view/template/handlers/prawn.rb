# frozen_string_literal: true

require 'prawn'

module ActionView
  module Template::Handlers
    class Prawn
      def self.register!
        ::ActionView::Template.register_template_handler :prawn, self
      end

      def self.call(template, source = template.source)
        %(extend #{DocumentProxy}; #{source}; pdf.render)
      end

      module DocumentProxy
        def pdf
          @pdf ||= ::Prawn::Document.new(::Spree::PrintInvoice::Config[:prawn_options])
        end

        private

        def method_missing(method, *args, &block)
          pdf.respond_to?(method) ? pdf.send(method, *args, &block) : super
        end
      end
    end
  end
end

::ActionView::Template::Handlers::Prawn.register!
