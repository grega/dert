class ErasureRequest < ApplicationRecord
	has_and_belongs_to_many :properties
  has_many :removal_actions, dependent: :destroy

  accepts_nested_attributes_for :removal_actions
  
	time_for_a_boolean :verified
	
	validates :email,  presence: true, format: { with: /\A.+@.+$\Z/ }, uniqueness: true

  def fulfilled?
    actions_completed = removal_actions.select{|action| action.completed === true}
    actions_completed.length === removal_actions.length ? true : false
  end

  def percent_fulfilled
    actions_completed = removal_actions.select{|action| action.completed === true}
    return ((actions_completed.length.to_f / removal_actions.length.to_f) * 100).to_i
  end
end
