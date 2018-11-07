class ErasureRequest < ApplicationRecord
	time_for_a_boolean :verified
	
	validates :email,  presence: true, format: { with: /\A.+@.+$\Z/ }, uniqueness: true
end
