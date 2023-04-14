class SendConfirmationJob < ApplicationJob
  queue_as :default

  def perform(order, current_user)
    # Do something later
    # order.save!

    OrderMailer.new_order(order, current_user).deliver_now
  end
end
