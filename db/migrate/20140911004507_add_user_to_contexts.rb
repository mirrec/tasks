class AddUserToContexts < ActiveRecord::Migration
  def change
    add_reference :contexts, :user, index: true
  end
end
