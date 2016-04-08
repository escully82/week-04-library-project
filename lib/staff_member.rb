# +   StaffMember Requirements    + #

# + Name  - validates presence
# + email - validates presence (unique)

# +   StaffMember Relationships    + #

# + staff_members belongs_to library (will contain library id/foreign key)
# + No association with patrons
# + No association with books

class StaffMember < ActiveRecord::Base

  validates :name,  presence:   true
  validates :email, presence:   true
  validates :email, uniqueness: true

  belongs_to :library

end
