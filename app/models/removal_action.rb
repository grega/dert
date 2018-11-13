class RemovalAction < ApplicationRecord
    belongs_to :erasure_request
    belongs_to :property

    time_for_a_boolean :completed
end
