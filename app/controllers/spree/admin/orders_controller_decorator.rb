Spree::Admin::OrdersController.class_eval do
  respond_to :pdf

  def show
    load_order
    respond_with(@order) do |format|
      format.pdf do
        template = params[:template] || "invoice"
        if (template == "invoice") && Spree::PrintInvoice::Config.use_sequential_number? && !@order.invoice_number.present?
          @order.invoice_number = Spree::PrintInvoice::Config.current_invoice_number_generator_class.new(@order).generate
          @order.invoice_date = Date.today
          @order.save!
        end
        render :layout => false , :template => "spree/admin/orders/#{template}.pdf.prawn"
      end
    end
  end
end
