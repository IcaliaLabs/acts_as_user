$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'active_record'
require 'shoulda-matchers'

begin
  require 'rails'
rescue LoadError
end

require 'bundler/setup'
Bundler.require

require 'database_cleaner'

require 'fake_gem' if defined? ActiveRecord

ActiveRecord::Base.establish_connection adapter: "sqlite3", database: ":memory:"
#Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}
load File.dirname(__FILE__) + '/support/acts_as_user_initializer.rb'
load File.dirname(__FILE__) + '/support/schema.rb'
load File.dirname(__FILE__) + '/support/models.rb'

I18n.enforce_available_locales = false

include Shoulda::Matchers::ActiveRecord