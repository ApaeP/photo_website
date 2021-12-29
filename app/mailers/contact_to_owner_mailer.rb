class ContactToOwnerMailer < ApplicationMailer
  def new_contact
    @contact = params[:contact]

    mail(to: ENV['GMAIL_USER'], subject: "Demande de contact")
  end
end
