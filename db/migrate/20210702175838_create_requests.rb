class CreateRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :requests do |t|
      t.belongs_to :requester, class_name: 'person'
      t.belongs_to :point_person, class_name: 'techie'
      t.text :description

      t.timestamps
    end
  end
end
