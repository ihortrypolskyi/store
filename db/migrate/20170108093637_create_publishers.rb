class CreatePublishers < ActiveRecord::Migration[5.0]
  def change
    create_table :publishers do |t|
      t.string :publisher_name
      t.timestamps
    end
  end
end
