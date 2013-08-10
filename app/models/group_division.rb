class GroupDivision < ActiveRecord::Base
  validates_presence_of :group_id, :name, :abbreviation, :weight

  belongs_to :group

  has_many :group_rosters
  has_many :rosters, through: :group_rosters

  scope :default_first, -> { where(default: true).first }
end