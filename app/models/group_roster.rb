class GroupRoster < ActiveRecord::Base
  belongs_to :group
  belongs_to :roster
end