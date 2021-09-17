class Book < ApplicationRecord
  belongs_to :genre
  belongs_to :author

  validates :title, presence: true
  validates :year, presence: true
  validates :author_id, presence: true
  validates :genre_id, presence: true
end
