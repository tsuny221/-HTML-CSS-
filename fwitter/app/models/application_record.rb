class ApplicationRecord < ActiveRecord::Base
	validates :name, {presence:true, length: {maximum: 10}}
	validates :introduction, {presence:true, length: {maximum: 120}}
  self.abstract_class = true
end
