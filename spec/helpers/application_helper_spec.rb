require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe 'test full title' do
    it 'works with no title' do
      expect(full_title).to eq('Disaster Resource Network')
    end

    it 'works with a title' do
      expect(full_title('title')).to eq('title | Disaster Resource Network')
    end

  end
end
