class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.find_it(id)
    find(id)
  end

  def self.find_it_by_name(name)
    find_by_name(name)
  end
end
