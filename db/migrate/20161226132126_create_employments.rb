class CreateEmployments < ActiveRecord::Migration[5.0]
  def change
    create_table :employments do |t|
      # t.references :user, index: true, foreign_key: true
      t.string :employer_name
      t.string :employer_address
      # t.string :position
      t.string :company_logo
      t.timestamps
    end
  end
end
