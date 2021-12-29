class ContactToOwnerMailer < ApplicationMailer
  def new_contact
    @contact = params[:contact]

    mail(to: ENV['GMAIL_USER'], subject: "You got a new order!")
  end
end
