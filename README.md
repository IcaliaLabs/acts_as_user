#Acts as user
[![Build Status](https://travis-ci.org/IcaliaLabs/acts_as_user.png?branch=master)](https://travis-ci.org/IcaliaLabs/acts_as_user)
[![Code Climate](https://codeclimate.com/github/IcaliaLabs/acts_as_user.png)](https://codeclimate.com/github/IcaliaLabs/acts_as_user)

Acts as user handles multiple user roles on a rails app. It uses polymorphic associations to relate other models and behave like a user.


## Getting started

ActsAsUser 1.0.0 works with rails 3 onwards. You can add it to your Gemfile with:

```ruby
gem 'acts_as_user'
```

Then run the bundle command to install it.

After you install ActsAsUser you need to run the generator:

```console
rails g acts_as_user:install
```

The generator will install in initializer which describes all the ActsAsUser configuration options, so we recommend you take a look at it. When you are done you are ready to start your user model:

```console
rails g acts_as_user User <attributes>
```

Next you'll probably want to run the migrations "rake db:migrate", as the generator will create a migration file (open it modify if you need to).

##Configuration

For the models you want to inherit to you just have to add this line of code into them:

```ruby
class Member
	acts_as_user
end
```

A little note on the User model...just in case!

```ruby
class User
	is_user
end
```

###Ignore attributes to delegate from the user

If you want to ignore some attributes from your user model to the childs, you can do it on the ```acts_as_user.rb``` initializer like so:

```ruby
ActsAsUser.setup do |config|
	config.ignored_attributes = ["name", "bio"]
end
```

By default it ignores the following attributes:

```ruby
["created_at", "updated_at", "id", "userable_type", "userable_id"]
```


##Devise support

Yes we do!

Acts as a user plays well with Devise as it ignores and adds the corresponding attributes to delegate to.

When using devise, ActsAsUser will also ignore the ```encrypted_password``` attribute from the user. No further configuration needs to be done.

##Getting to know the user

ActsAsUser gem now adds some handy instance user methods that returns true or false wheter the current user is a specific type or not, for example:

A simple configuration may look something similar to:

```ruby
class User < ActiveRecord::Base
 is_user
end

class Customer < ActiveRecord::Base
 acts_as_user
end

class Admin < ActiveRecord::Base
 acts_as_user
end
```

Now we will instantiate a Customer object:

```console
customer = Customer.find(1)
current_user = customer.user
```

You now should be able to detect in this case if the current_user is wheter an admin or a customer by simply calling:

```console
current_user.customer?
 => true
current_user.admin?
 => false
```

Enjoy!

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request


###Psst! Here is a live example in rails

[Rails acts as user example](https://github.com/IcaliaLabs/acts_as_user_example)

### Devs

* Abraham Kuri (https://github.com/kurenn)
* Patricio Beltrán (https://github.com/patobeltran)

### Future

* Support for Mongoid
* Add wiki


## Credits
Icalia Labs - weare@icalialabs.com

[Follow us](http://twitter.com/icalialabs "Follow us")


[Like us on Facebook](https://www.facebook.com/icalialab "Like us on Facebook")


### License

MIT License. Copyright 2012-2013 IcaliaLabs. http://icalialabs.com
