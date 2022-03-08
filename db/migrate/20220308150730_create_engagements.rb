class CreateEngagements < ActiveRecord::Migration[6.0]
  def change
    create_table :engagements do |t|
      t.integer :client_id
      t.integer :user_id
      t.string :engagement_name
      t.string :engagement_detail

      t.timestamps
    end
  end
end
