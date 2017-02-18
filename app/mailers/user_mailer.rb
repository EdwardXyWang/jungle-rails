class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def checkout_email(order, current_user)
    @order = order
    @current_user = current_user
    mail(to: @current_user.email,
      subject: "Your order #{@order.id} is generated.") do |format|
        format.html {render "checkout_email"}
      end
  end
end
