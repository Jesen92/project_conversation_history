# frozen_string_literal: true

class CreateProjectsComments < ActiveRecord::Migration[7.0]
  def change
    create_table :projects_comments do |t|
      t.integer :project_id
      t.integer :user_id

      t.timestamps
    end
  end
end
