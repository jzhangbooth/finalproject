# == Schema Information
#
# Table name: internal_tasks
#
#  id            :integer          not null, primary key
#  task_detail   :string
#  task_name     :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  client_id     :integer
#  engagement_id :integer
#
class InternalTask < ApplicationRecord

  belongs_to(:client, { :required => true, :class_name => "Client", :foreign_key => "client_id" })
  belongs_to(:engagement, { :required => true, :class_name => "Engagement", :foreign_key => "engagement_id" })

end