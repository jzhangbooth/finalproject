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

  belongs_to(:client, { :required => true, :class_name => "Client", :foreign_key => "client_id" })
  has_many(:internal_tasks, { :class_name => "InternalTask", :foreign_key => "engagement_id", :dependent => :destroy })
  belongs_to(:user, { :required => true, :class_name => "User", :foreign_key => "user_id" })
  
end