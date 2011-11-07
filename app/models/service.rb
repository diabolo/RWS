class Service < ActiveRecord::Base
  validates_presence_of :requestor
end
