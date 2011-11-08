class Service < ActiveRecord::Base
  validates_presence_of :requestor

  def self.usage(instance = nil)
    usg = {:usage => "Use me like this"}
    err = instance.errors.to_hash rescue {}
    usg.merge(err).to_json
  end
end
