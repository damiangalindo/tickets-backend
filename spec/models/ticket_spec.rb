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

require 'rails_helper'

RSpec.describe Ticket, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end