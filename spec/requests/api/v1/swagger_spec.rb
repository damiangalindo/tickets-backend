require 'rails_helper'

RSpec.describe API::V1::Tickets, type: :apivore, order: :defined do
  subject { Apivore::SwaggerChecker.instance_for('/api/swagger_doc.json') }

  context 'has valid paths' do
  end

  describe 'and' do
    it 'tests all documented routes' do
      expect(subject).to validate_all_paths
    end
  end
end
