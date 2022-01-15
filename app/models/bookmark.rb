class Bookmark < ApplicationRecord
  belongs_to :movie, dependent: :destroy
  belongs_to :list, dependent: :destroy
  validates :comment, length: {minimum: 6}
  # the movie_id is unique to the list_id
  validates :movie, uniqueness: {scope: :list}
end
