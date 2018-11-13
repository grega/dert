class CreateRemovalActions < ActiveRecord::Migration[5.2]
  def change
    create_table :removal_actions, id: :uuid do |t|
    	t.text :notes
      t.datetime :completed_at
      t.belongs_to :erasure_request, type: :uuid, index: true
      t.belongs_to :property, type: :uuid, index: true
      
      t.timestamps
    end
  end
end
