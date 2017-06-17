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

require 'rails_helper'

RSpec.describe Reponse, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
