class Bookmark < ApplicationRecord
  has_one_attached :photo
  belongs_to :movie
  belongs_to :list
  validates :comment, length: {minimum: 6}
  # the movie_id is unique to the list_id
  validates :movie, uniqueness: {scope: :list, message: "Already added to the list"}
end
