class Contact < ApplicationRecord
  validates :content, presence: true, length: { minimum: 15, message: 'Un peu court' }
  validates_presence_of :email, message: 'Requis'
  validates_format_of :email, with: URI::MailTo::EMAIL_REGEXP, message: 'Email invalide'
  after_create :send_emails

  private

  def send_emails
    ContactToOwnerMailer.with(contact: self).new_contact.deliver_later
    ContactToSenderMailer.with(contact: self).new_contact.deliver_later
  end
end
