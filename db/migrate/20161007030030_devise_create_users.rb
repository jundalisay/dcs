class DeviseCreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|

      t.boolean :admin
      t.datetime :deleted_at
      t.string :username
      t.string :first_name
      t.string :last_name

      t.string :phone
      t.string :phone2
      t.date :birthday
      t.string :gender, default: "female"
      t.string :rel_status

      t.string :filepicker_url

      t.string :user_street_address
      t.string :user_district
      t.string :user_city
      t.string :user_province
      t.string :user_country
      t.string :user_region, default: "Vietnam"

      t.string :hobbies
      t.string :weaknesses
      t.string :strengths

      t.boolean :verified

      t.string :national_id
      t.string :drivers_license
      t.string :social_security
      t.string :voters_id

      t.string :status, default: "Hello!"
      t.text :about
      t.string :avatar
      t.string :photo
      
      t.string :website
      t.string :facebook
      t.string :linkedin
      t.string :skype

      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.inet     :current_sign_in_ip
      t.inet     :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at
      t.timestamps null: false
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
    # add_index :users, :confirmation_token,   unique: true
    # add_index :users, :unlock_token,         unique: true
  end
end
