class ErasureRequest < ApplicationRecord
	has_and_belongs_to_many :properties
  has_many :removal_actions

  accepts_nested_attributes_for :removal_actions
  
	time_for_a_boolean :verified
	
	validates :email,  presence: true, format: { with: /\A.+@.+$\Z/ }, uniqueness: true
end
