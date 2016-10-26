class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.string :user_name
      t.string :email
      t.string :fname
      t.string :lname
      t.string :password
      t.string :confirm_password

      t.timestamps
    end
  end
end
