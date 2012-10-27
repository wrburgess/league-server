# == Schema Information
#
# Table name: api_logs
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ApiLog < ActiveRecord::Base
  # attr_accessible :title, :body
end
