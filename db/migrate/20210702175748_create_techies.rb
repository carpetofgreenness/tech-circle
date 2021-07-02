class CreateTechies < ActiveRecord::Migration[6.1]
  def change
    create_table :techies do |t|

      t.timestamps
    end
  end
end
