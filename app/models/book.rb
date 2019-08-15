class Book < ApplicationRecord
  belongs_to :user
  has_many :words
  validates :name, presence: true
end
