class Author < ApplicationRecord
  has_many :books

  validates :name, presence: true
  validates :last_name, presence: true
  validates :age, presence: true
end
