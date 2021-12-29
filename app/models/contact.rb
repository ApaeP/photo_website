class Contact < ApplicationRecord
  validates :email, :content, presence: true

  after_create :send_emails

  def send_emails
    ContactToOwnerMailer.with(contact: self).new_contact.deliver_later
    ContactToSenderMailer.with(contact: self).new_contact.deliver_later
  end
end
