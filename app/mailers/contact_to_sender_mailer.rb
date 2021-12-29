class ContactToSenderMailer < ApplicationMailer
  def new_contact
    @contact = params[:contact]

    mail(to: @contact.email, subject: "You got a new order!")
  end
end
