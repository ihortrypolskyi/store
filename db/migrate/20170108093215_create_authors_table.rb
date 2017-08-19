class CreateAuthorsTable < ActiveRecord::Migration[5.0]
  def change
    create_table :authors do |t|
      t.string :first_name
      t.string :last_name
      t.timestamps
    end
  end
end

# class CreateAuthors < ActiveRecord::Migration[5.0]
#   def change
#     create_table :authors do |t|
#       t.string :author_first_name
#       t.string :author_last_name

#       t.timestamps
#     end
#   end
# end
