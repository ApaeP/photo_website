class Contact < ApplicationRecord
  validates :email, :content, presence: true
end
