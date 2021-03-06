class CreateJoinTableBookPublisher < ActiveRecord::Migration[5.0]
  def change
    create_join_table :books, :publishers do |t|
      t.index [:book_id, :publisher_id]
      t.index [:publisher_id, :book_id]
    end
  end
end
