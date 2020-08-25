require 'rails_helper'

RSpec.describe 'category' do
  context 'when Category exists' do
    let!(:category) { create(:random_category) }

    it 'should NOT allow the creation of a category with repeated name' do
      new_category = Category.new(name: category.name)
      new_category.valid?
      expect(new_category.errors.messages[:name]).to eql(['has already been taken'])
    end
  end
end
