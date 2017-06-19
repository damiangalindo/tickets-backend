# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  username               :string           default(""), not null
#  user_type              :string           default("customer"), not null
#  first_name             :string
#  last_name              :string
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  authentication_token   :string(30)
#
# Indexes
#
#  index_users_on_authentication_token    (authentication_token) UNIQUE
#  index_users_on_email                   (email) UNIQUE
#  index_users_on_reset_password_token    (reset_password_token) UNIQUE
#  index_users_on_user_type_and_username  (user_type,username) UNIQUE
#

class User < ApplicationRecord
  acts_as_token_authenticatable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :tickets
  has_many :responses

  VALID_USERNAME_FORMAT = /\A[a-zA-Z_0-9]\w*\z/

  validates :user_type, presence: true, inclusion: { in: %w(customer agent) }
  validates :username, presence: true, format: { with: VALID_USERNAME_FORMAT, message: 'is not a valid username' }, uniqueness: { scope: [:user_type] }

  def self.authenticate(email, password)
    user = User.find_for_authentication(email: email)
    user.valid_password?(password) ? user : nil
  end
end
