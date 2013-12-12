module ActsAsUser
  module IsUser
    def self.included(base)
      base.belongs_to :userable, polymorphic: true
    end
  end
end
