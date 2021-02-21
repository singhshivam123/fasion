# frozen_string_literal: true

# :nodoc:
class ContactMailer < ApplicationMailer
  def welcome_email(contact)
    @contact = contact
    mail(to: @contact.email, subject: 'Welcome to My Fasion')
  end
end
