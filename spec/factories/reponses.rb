# == Schema Information
#
# Table name: reponses
#
#  id         :integer          not null, primary key
#  ticket_id  :integer
#  user_id    :integer
#  response   :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :reponse do
    ticket nil
    user nil
    response "MyText"
  end
end
