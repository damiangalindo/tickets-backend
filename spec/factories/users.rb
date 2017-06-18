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

FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "username#{n}" }
    sequence(:email) { |n| "person#{n}@example.com" }
    password 'password'
    password_confirmation 'password'

    trait :agent do
      user_type 'agent'
    end
  end
end
