class CreateClients < ActiveRecord::Migration[6.0]
  def change
    create_table :clients do |t|
      t.string :client_name
      t.string :client_email

      t.timestamps
    end
  end
end
