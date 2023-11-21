# frozen_string_literal: true

class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  devise :omniauthable, omniauth_providers: [:google_oauth2]

  def self.from_omniauth(access_token)
    data = access_token.info
    account = Account.where(email: data["email"]).first

    # Uncomment the section below if you want users to be created if they don't exist
    return account if account

    Account.create(
      email: data["email"],
      password: Devise.friendly_token[0, 20],
      provider: access_token["provider"],
      uid: access_token["uid"],
    )
  end
end

# == Schema Information
#
# Table name: accounts
#
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  provider               :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  uid                    :string
#
