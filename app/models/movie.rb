class Movie < ApplicationRecord
  has_many :bookmarks
  validates :title, length: {minimum: 7}, uniqueness: true
  validates :overview, length: {minimum: 7}
end
