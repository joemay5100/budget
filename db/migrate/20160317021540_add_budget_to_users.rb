class AddBudgetToUsers < ActiveRecord::Migration
  def change
    change_table :Users do |t|
      t.references :budget, index: true, foreign_key: true
    end
  end
end
