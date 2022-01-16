class Movie < ApplicationRecord
  has_many :bookmarks
  validates :title, length: {minimum: 7}, uniqueness: true, presence: true
  validates :overview, length: {minimum: 7}, presence: true
end
