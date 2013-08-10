class SystemPeriod < ActiveRecord::Base
  validates_presence_of :period, :start_date, :end_date
end