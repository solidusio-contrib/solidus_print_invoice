module SolidusPrintInvoice
  class Engine < Rails::Engine
    isolate_namespace Spree
    engine_name 'solidus_print_invoice'

    config.autoload_paths += %W(#{config.root}/lib)

    config.generators do |g|
      g.test_framework :rspec
    end

    initializer 'solidus_print_invoice.environment', before: :load_config_initializers do |app|
      SolidusPrintInvoice::Config = SolidusPrintInvoice::Configuration.new
    end

    initializer 'solidus_print_invoice.mimetypes' do |app|
      Mime::Type.register('application/pdf', :pdf) unless Mime::Type.lookup_by_extension(:pdf)
    end

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), '../../app/**/*_decorator*.rb')) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end
    end

    config.to_prepare &method(:activate).to_proc
  end
end
