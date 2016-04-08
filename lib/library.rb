# +   Library Requirements    + #

# + Name         - validates presence
# + Address      - validates presence
# + Phone number - validates presence (unique, if possible)

# +   Library Relationships    + #

# + library has_many books (will be a(n) id/foreign key in books)
# + library has_many staff (will be a(n) id/foreign key in staff_members)
# + No association with patrons


class Library < ActiveRecord::Base

  validates :branch_name,     presence:   true
  validates :address,         presence:   true
  validates :phone_number,    presence:   true

  has_many :staff_members
  has_many :books

end
