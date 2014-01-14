class User < ActiveRecord::Base
  is_user 
  validates :email, presence: true
end

class Customer < ActiveRecord::Base
  acts_as_user
end

class Admin < ActiveRecord::Base
  acts_as_user
end
