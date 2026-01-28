require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the TIcketsHelper. For example:
#
# describe TIcketsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe TicketsHelper, type: :helper do
  describe 'test phone number format' do
    it 'formats with dashes' do
      expect(format_phone_number('555-123-4567')).to eq('+15551234567')
    end

    it 'formats with spaces with parentheses' do
      expect(format_phone_number('(555) 123 4567')).to eq('+15551234567')
    end

    it 'formats with spaces without parentheses' do
      expect(format_phone_number('555 123 4567')).to eq('+15551234567')
    end

    it 'formats with dots' do
      expect(format_phone_number('555.123.4567')).to eq('+15551234567')
    end

    it 'formats without spaces' do
      expect(format_phone_number('5551234567')).to eq('+15551234567')
    end

    it 'formats with spaces with parentheses and +1' do
      expect(format_phone_number('+1 (555) 123 4567')).to eq('+15551234567')
    end

    it 'returns nil on failure' do
      expect(format_phone_number('One two three')).to eq(nil)
    end
    
  end

end
