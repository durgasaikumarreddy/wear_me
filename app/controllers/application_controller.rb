class ApplicationController < ActionController::Base
    def after_sign_in_path_for(user)
        cart=Cart.find(session[:cart_id])
        if session[:cart_id] = cart.id
            cart
        else session[:cart_id] = nil
            shoes_index_path
        end
    end
    def after_sign_out_path_for(user)
        "/users/sign_in"
    end

    def current_cart
        begin
            Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
            cart=Cart.create
            session[:cart_id] = cart.id
            cart
        end
    end 
end
