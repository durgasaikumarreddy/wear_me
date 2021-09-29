class OrderMailer < ApplicationMailer
    def order_success(user,cart)
        @user = user
        @email=@user.email
        @cart = cart
        mail(:to=>"#{@email}", :subject=>"Order success")
    end
end
