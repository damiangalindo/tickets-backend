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

require 'rails_helper'

RSpec.describe Ticket, type: :model do
  describe 'Associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:responses) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:message) }
    it { is_expected.to validate_presence_of(:subject) }
    it { is_expected.to validate_presence_of(:state) }
  end

  context 'States' do
    subject { build(:ticket) }

    it 'retrieving should be the initial state' do
      expect(subject).to be_open
    end

    it 'has a transition from :open to :closed on :close' do
      expect(subject).to transition_from(:open).to(:closed).on_event(:close)
    end
  end
end
