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
end
