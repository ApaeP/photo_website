class ContactToSenderMailer < ApplicationMailer
  def new_contact
    @contact = params[:contact]

    mail(to: @contact.email, subject: "Votre demande de contact")
  end
end
