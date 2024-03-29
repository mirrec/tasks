class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :description
      t.references :context, index: true

      t.timestamps
    end
  end
end
