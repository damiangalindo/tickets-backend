# == Schema Information
#
# Table name: responses
#
#  id         :integer          not null, primary key
#  ticket_id  :integer
#  user_id    :integer
#  response   :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_responses_on_ticket_id  (ticket_id)
#  index_responses_on_user_id    (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (ticket_id => tickets.id)
#  fk_rails_...  (user_id => users.id)
#

class Response < ApplicationRecord
  belongs_to :ticket
  belongs_to :user

  validates :response, presence: true
end
