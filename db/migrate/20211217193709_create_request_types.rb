class CreateRequestTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :request_types do |t|
      t.string :description
      t.timestamps
    end

    add_column :requests, :request_type_id, :integer
  end
end
