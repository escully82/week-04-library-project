# + Adding library_id column to books table

class AddLibraryIdToBooksTable < ActiveRecord::Migration

  def change
    add_column :books, :library_id, :integer
  end

end
