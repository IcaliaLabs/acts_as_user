# This hook is use to setup the configuration for creating models through
# rails generators
ActsAsUser.setup do |config|

  # ==> ORM Configuration
  # Load and configure the ORM. Supports :active_record
  require 'acts_as_user/orm/active_record'

end
