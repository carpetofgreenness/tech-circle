class CreateRequestStatuses < ActiveRecord::Migration[6.1]
  def change
    create_table :request_statuses do |t|
      t.string :description
      t.timestamps
    end

    add_column :requests, :request_status_id, :integer
  end
end
