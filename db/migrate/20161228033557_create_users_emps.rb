class CreateUsersEmps < ActiveRecord::Migration[5.0]
  def change
    create_table :users_emps do |t|
	    t.references :user, index: true, foreign_key: true
      t.references :employment, index: true, foreign_key: true
      t.string :position
      t.date :from_date
      t.date :to_date
      t.timestamps
    end
  end
end
