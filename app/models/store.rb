class Store < ApplicationRecord
    has_one_attached :product_image
    product_image.attach(params[:product_image])
end
