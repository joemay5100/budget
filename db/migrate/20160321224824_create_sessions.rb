class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      
      t.references :user, foreign_key: true
      t.datetime :login_at
      t.datetime :logout_at

      t.timestamps null: true
    end
  end
end
