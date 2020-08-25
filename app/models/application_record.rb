class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.find_it(id)
    find(id) if id
  end

  def self.find_it_by_name(name)
    find_by_name(name) if name
  end

  def self.find_by_category(category)
    find_by(category_id: category)
  end
end
