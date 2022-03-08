# == Schema Information
#
# Table name: clients
#
#  id           :integer          not null, primary key
#  client_email :string
#  client_name  :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Client < ApplicationRecord

  has_many(:engagements, { :class_name => "Engagement", :foreign_key => "client_id", :dependent => :destroy })

  has_many(:internal_tasks, { :class_name => "InternalTask", :foreign_key => "client_id", :dependent => :destroy })
  

end