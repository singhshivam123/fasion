# frozen_string_literal: true

# :nodoc:
class User < ApplicationRecord
  # Validation
  validates(
    :first_name, :last_name,
    presence: { message: 'must be given please' },
    length: { minimum: 3, maximum: 50 }
  )

  validates(
    :gender,
    inclusion: { in: %w[male female],
                 message: 'only allows Male or Female' }
  )
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  # Assocation
  has_many :carts, dependent: :destroy
  has_many :orders, dependent: :destroy
end
