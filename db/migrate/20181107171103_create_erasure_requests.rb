class CreateErasureRequests < ActiveRecord::Migration[5.2]
  def change
    enable_extension 'pgcrypto'
    create_table :erasure_requests, id: :uuid do |t|
      t.string :email
      t.string :verify_token
      t.datetime :verified_at

      t.timestamps
    end
  end
end
