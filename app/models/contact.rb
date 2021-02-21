# frozen_string_literal: true

# :nodoc:
class Contact < ApplicationRecord
  # validation
  validates(
    :name,
    presence: { message: 'must be given please' },
    length: { minimum: 3, maximum: 50 }
  )
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :subject, presence: true, length: { minimum: 5, maximum: 100 }
  validates :message, presence: true, length: { minimum: 5, maximum: 500 }

  # callback
  after_commit :send_welcome_mail, on: :create

  def send_welcome_mail
    ContactMailer.welcome_email(self).deliver_now
  end
end
