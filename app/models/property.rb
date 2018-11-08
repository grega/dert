class Property < ApplicationRecord
	has_and_belongs_to_many :erasure_requests

	time_for_a_boolean :completed

	validates :name,  presence: true, uniqueness: true
	validates :url,   presence: true, uniqueness: true
end
