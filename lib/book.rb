# +   Book Requirements    + #

# + Author - validates presence
# + Title  - validates presence
# + ISBN   - validates presence (unique, if possible)

# +   Book Relationships    + #

# + book belongs_to patron (will contain patron id/foreign key)
# + book belongs_to library (will contain library id/foreign key)
# + No association with staff_members


class Book < ActiveRecord::Base

  validates :title,  presence:   true
  validates :author, presence:   true
  validates :isbn,   presence:   true
  validates :isbn,   uniqueness: true

  belongs_to :library
  belongs_to :patron

end
