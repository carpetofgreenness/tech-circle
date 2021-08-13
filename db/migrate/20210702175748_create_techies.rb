class CreateTechies < ActiveRecord::Migration[6.1]
  def change
    create_table :techies do |t|
      t.belongs_to :user
      t.belongs_to :person

      t.timestamps
    end
  end
end
