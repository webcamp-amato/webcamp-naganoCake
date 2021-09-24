# frozen_string_literal: true

class Genre < ApplicationRecord
  has_many :items
  validates :name, length: { minimum: 1, maximum: 30 }
end
