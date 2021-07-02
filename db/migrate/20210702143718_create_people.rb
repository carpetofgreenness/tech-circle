# frozen_string_literal: true

class CreatePeople < ActiveRecord::Migration[6.1]
  def change
    create_table :people do |t|
      t.text :email
      t.text :first_name
      t.text :last_name
      t.string :phone_number
      t.text :address
      t.text :city
      t.text :state
      t.integer :zip

      t.references :user, null: true, foreign_key: true

      t.timestamps
    end
  end
end
