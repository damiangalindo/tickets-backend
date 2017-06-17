# == Schema Information
#
# Table name: tickets
#
#  id           :integer          not null, primary key
#  message      :text
#  status       :string
#  user_id      :integer
#  closed_by_id :integer
#  subject      :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

FactoryGirl.define do
  factory :ticket do
    message "MyText"
    status "MyString"
    user nil
    closed_by_id 1
    subject "MyString"
  end
end
