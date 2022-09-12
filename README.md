# How to recreate this project

```bash
rails new encryption_test
rails g model User username password
rails db:migrate
bin/rails db:encryption:init
EDITOR=vim bin/rails credentials:edit
```

Add keys generated from `db:encryption:init` to credentials file and save.

Edit `app/models/user.rb`:

```ruby
class User < ApplicationRecord
  encrypts :password
end
```

Go to `rails console` and try this:

```
User.create!(username: "test", password: "test1")
```

`encrypt` method in `lib/active_record/encryption/cipher/aes256_gcm.rb` is called three times.
