class CreateInternalTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :internal_tasks do |t|
      t.integer :engagement_id
      t.integer :client_id
      t.string :task_name
      t.string :task_detail

      t.timestamps
    end
  end
end
