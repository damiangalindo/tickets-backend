# == Schema Information
#
# Table name: tickets
#
#  id           :integer          not null, primary key
#  message      :text             not null
#  state        :string           default("open"), not null
#  user_id      :integer          not null
#  closed_by_id :integer
#  subject      :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_tickets_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

FactoryGirl.define do
  factory :ticket do
    message "MyText"
    state "open"
    user nil
    closed_by_id 1
    subject "MyString"
  end
end
