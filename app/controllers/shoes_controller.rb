class ShoesController < ApplicationController
  def index
    @shoes = Store.all
  end

  def search
    keyword = "%" + params[:search].to_s + "%"
    @shoes = Store.find_by_sql ["SELECT * FROM stores WHERE name like ? or brand like ? or description like ?", keyword, keyword, keyword]
  end

  def checkout
    if request.post?
      amount = session[:amount].to_i
    
      ActiveMerchant::Billing::Base.mode = :test

      credit_card = ActiveMerchant::Billing::CreditCard.new(
        :number     => params[:number],
        :month      => params[:month],
        :year       => params[:year],
        :first_name => params[:first_name],
        :last_name  => params[:last_name],
        :verification_value  => params[:verification_value])

      if credit_card.valid?
        gateway = ActiveMerchant::Billing::TrustCommerceGateway.new(
          :login => 'TestMerchant',
          :password => 'password')
        
        response = gateway.authorize(amount,credit_card)
        

        if response.success?
          
          OrderMailer.order_success(current_user, current_cart).deliver
          gateway.capture(amount, response.authorization)
          redirect_to :controller=>:shoes, :action => :purchase_complete
          session[:user] = nil
          
        else
          flash[:notice] = "Please! Enter Valid  card details."
          render :action =>:checkout
        end
      end
    end
  end
end
