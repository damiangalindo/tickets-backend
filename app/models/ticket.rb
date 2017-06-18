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

class Ticket < ApplicationRecord
  include AASM

  belongs_to :user
  has_many :responses

  validates :message, presence: true
  validates :state, presence: true
  validates :subject, presence: true

  aasm column: 'state' do
    state :open, initial: true
    state :closed

    event :close do
      transitions from: :open, to: :closed
    end
  end
end
