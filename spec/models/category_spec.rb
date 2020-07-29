require 'rails_helper'

RSpec.describe 'category' do
  context 'when pending category exists' do
    let!(:category) { create(:random_category) }

    it 'should create a new category' do
      expect(category.id).to eql(1)
    end

    it 'should NOT allow a category to save in db when a priority out of range is given' do
      category.priority = 666
      expect(category.valid?).to eql(false)
    end
  end
end
