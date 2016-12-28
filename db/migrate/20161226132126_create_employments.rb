class CreateEmployments < ActiveRecord::Migration[5.0]
  def change
    create_table :employments do |t|

      t.string :employer_name
      t.string :employer_address
      t.string :position
      t.date :from_date
      t.date :to_date
      t.string :company_logo
      t.timestamps
    end
  end
end
