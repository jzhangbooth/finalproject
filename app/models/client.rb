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
end
