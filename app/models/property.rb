class Property < ApplicationRecord
	has_and_belongs_to_many :erasure_requests
  has_many :removal_actions, dependent: :destroy

  validates :name,  presence: true, uniqueness: true
  validates :url,   presence: true, uniqueness: true
end
