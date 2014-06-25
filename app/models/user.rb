class User < ActiveRecord::Base
  has_one :groupInt
  has_one :individualInt
end
