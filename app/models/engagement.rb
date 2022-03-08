# == Schema Information
#
# Table name: engagements
#
#  id                :integer          not null, primary key
#  engagement_detail :string
#  engagement_name   :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  client_id         :integer
#  user_id           :integer
#
class Engagement < ApplicationRecord
end
