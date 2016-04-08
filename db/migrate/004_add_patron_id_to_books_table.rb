# + Adding patron_id column to the books table

class AddPatronIdToBooksTable < ActiveRecord::Migration
  
  def change
    add_column :books, :patron_id, :integer
  end

end
