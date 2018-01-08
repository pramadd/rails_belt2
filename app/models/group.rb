class Group < ActiveRecord::Base
  belongs_to :user




  has_many :joined_members, through: :members
  validates :name, presence: true, length: { minimum: 5}
  validates :description, presence: true, length: { minimum: 10}

def member_count
  members = Member.where(group_id: self.id)
  puts "counting members"
  count = members.count
end

def is_member?(user_id)
  members = Member.where(group_id: self.id)
  puts "inside members model"
  members.each do |m|
    if m.user_id == user_id
      return true;
    end
  end
  return false;
end
  
end
