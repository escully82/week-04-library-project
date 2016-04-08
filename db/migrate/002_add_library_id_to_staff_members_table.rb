# + Adding a library_id column to the staff_members table

class AddLibraryIdToStaffMembersTable < ActiveRecord::Migration

  def change
    add_column :staff_members, :library_id, :integer
  end

end
