class Contact < ApplicationRecord
  validates :content, presence: true, length: { minimum: 15 }
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  after_create :send_emails

  def send_emails
    ContactToOwnerMailer.with(contact: self).new_contact.deliver_later
    ContactToSenderMailer.with(contact: self).new_contact.deliver_later
  end
end
