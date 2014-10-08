# == Schema Information
#
# Table name: flyers
#
#  id          :integer          not null, primary key
#  created_at  :datetime
#  updated_at  :datetime
#  title       :string(255)
#  address     :string(255)
#  description :text
#  contact     :string(255)
#  image       :string(255)
#

class Flyer < ActiveRecord::Base
end
