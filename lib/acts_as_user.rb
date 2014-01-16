require "acts_as_user/version"
require 'orm_adapter'
require 'active_support/dependencies'

module ActsAsUser
  extend ActiveSupport::Autoload

  #Eager loads the modules
  autoload :UserDelegate, 'acts_as_user/user_delegate'
  autoload :IsUser,       'acts_as_user/is_user'

  #We ignore some attribues that might cause a collision between models
  @@default_ignored_attributes = ["created_at", "updated_at", "id", "userable_type", "userable_id"]

  #Array to define the models that are inhering from the user
  @@models_acting_like_users = []
  mattr_reader :models_acting_like_users

  #We append the extra attributes you want to ignore to the default ones
  mattr_accessor :ignored_attributes
  @@ignored_attributes = @@ignored_attributes.to_a + @@default_ignored_attributes

  mattr_accessor :models_acting_as_users
  @@models_acting_as_users = []

  def self.setup
    yield self    
  end

  #Checking if devise is present
  def self.devise?
    defined?(Devise).present?
  end

  #We add some virtual attributes that dont't play well when devise is present
  def self.add_devise_attributes_to_ignore
    if self.devise?
      devise_ignore_attrs = ['password', 'password_confirmation', 'encrypted_password']
      self.ignored_attributes << devise_ignore_attrs
      self.ignored_attributes.flatten!
    end
  end
end

require 'acts_as_user/railtie'
