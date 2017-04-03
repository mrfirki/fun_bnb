class PaymentsController < ApplicationController
  before_action :require_login

  def new
  	@client_token = Braintree::ClientToken.generate
    @reservation = Reservation.find(params[:reservation_id])
    @payment = Payment.new
  end

  def create
  	  @reservation = Reservation.find(params[:reservation_id])
  	  @payment = Payment.new

	  nonce_from_the_client = params[:checkout_form][:payment_method_nonce]

	  result = Braintree::Transaction.sale(
	   :amount => @reservation.total_price.to_s, # @reservation.total_price.to_s this is currently hardcoded
	   :payment_method_nonce => nonce_from_the_client,
	   :options => {
	      :submit_for_settlement => true
	    }
	   )

	    @payment.reservation_id = @reservation.id
	    @payment.braintree_payment_id = result.transaction.id
	    @payment.fourdigit = result.transaction.credit_card_details.last_4

	  if result.success?
	    @payment.status = "success"
	    @payment.save
	    redirect_to :root, :flash => { :success => "Transaction successful!" }
	  else
	 	@payment.status = "failed"
	    @payment.save
	    redirect_to :root, :flash => { :error => "Transaction failed. Please try again." }
	  end   	
  end
end
