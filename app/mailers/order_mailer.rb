class OrderMailer < ApplicationMailer
    def new_order(order, current_user)
        @order = order
        @user = current_user

        mail(to: @user.email, subject: "New Order:")
    end
end
