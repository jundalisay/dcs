class CreateEducations < ActiveRecord::Migration[5.0]
  def change
    create_table :educations do |t|
      t.string :school_name
      t.string :school_address
      # t.string :course_name
      t.string :school_logo
      t.timestamps
    end
  end
end
