# +   Patron Requirements    + #

# + Name  - validates presence
# + email - validates presence (unique)

# +   Patron Relationships    + #

# + patron has_many books (will be a(n) id/foreign key in books table)
# + No association with libraries
# + No association with staff_members

class Patron < ActiveRecord::Base

  validates :name,  presence:   true
  validates :email, presence:   true
  validates :email, uniqueness: true

  has_many :books

end
