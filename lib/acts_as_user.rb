require "acts_as_user/version"

module ActsAsUser
  @@default_ignored_attributes = ["created_at", "updated_at", "id"]

  mattr_accessor :devise
  @@devise = defined?(Devise) 

  mattr_accessor :ignored_attributes
  @@ignored_attributes = @@ignored_attributes.to_a + @@default_ignored_attributes

  def self.setup
    yield self    
  end

end
