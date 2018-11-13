class CreateProperties < ActiveRecord::Migration[5.2]
  def change
    create_table :properties, id: :uuid do |t|
      t.string :name
      t.text :notes
      t.string :url

      t.timestamps
    end

    create_table :erasure_requests_properties, id: false do |t|
      t.belongs_to :erasure_request, type: :uuid, index: true
      t.belongs_to :property, type: :uuid, index: true
    end
  end
end
