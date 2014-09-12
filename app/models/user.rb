class User < ActiveRecord::Base
  belongs_to :groupInt
  has_one :individualInt
end
