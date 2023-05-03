class AddStatusToProjects < ActiveRecord::Migration[7.0]
  def change
    add_column :projects, :status, :string, default: 'to_do', null: false
  end
end
