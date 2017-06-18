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

require 'rails_helper'

RSpec.describe Response, type: :model do
  describe 'Associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:ticket) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:response) }
  end
end
