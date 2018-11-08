class ErasureRequest < ApplicationRecord
	has_and_belongs_to_many :properties
	
	time_for_a_boolean :verified
	
	validates :email,  presence: true, format: { with: /\A.+@.+$\Z/ }, uniqueness: true
end
