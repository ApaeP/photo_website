# Preview all emails at http://localhost:3000/rails/mailers/contact_to_sender_mailer
class ContactToSenderMailerPreview < ActionMailer::Preview
  def new_contact
    # Set up a temporary contact for the preview
    contact = Contact.new(email: "paulportier@gmail.com", content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam faucibus diam erat, quis faucibus nisi tempor eu. Suspendisse lectus mi, commodo lobortis libero et, rutrum aliquam mi. In at nisl sapien. Duis pretium tempor lacus a tempus. Mauris vel pharetra diam. Quisque placerat neque non tincidunt consectetur. Integer massa tellus, ultrices in elit in, tincidunt suscipit nisl. Nulla non suscipit diam, nec malesuada massa. Pellentesque commodo imperdiet auctor.')

    ContactToSenderMailer.with(contact: contact).new_contact
  end
end
