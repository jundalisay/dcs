class CreateUsersEds < ActiveRecord::Migration[5.0]
  def change
    create_table :users_eds do |t|
	    t.references :user, index: true, foreign_key: true
      t.references :education, index: true, foreign_key: true
      t.string :course_name
      t.date :from_date
      t.date :to_date
      t.timestamps
    end
  end
end
