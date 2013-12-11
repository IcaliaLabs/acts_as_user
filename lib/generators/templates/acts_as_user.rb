# This hook is use to setup the configuration for creating models through
# rails generators
ActsAsUser.setup do |config|

  # ==> ORM Configuration
  # Load and configure the ORM. Supports :active_record
  require 'orm_adapter/adapters/active_record'

end
