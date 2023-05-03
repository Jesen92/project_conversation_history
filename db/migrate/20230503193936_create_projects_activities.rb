class CreateProjectsActivities < ActiveRecord::Migration[7.0]
  def change
    create_table :projects_activities do |t|
      t.string :type, null: false
      t.jsonb :data
      t.integer :user_id, null: false
      t.integer :project_id, null: false

      t.timestamps
    end

    add_foreign_key :projects_activities, :projects, column: :project_id
    add_foreign_key :projects_activities, :users, column: :user_id
  end
end
