class User < ActiveRecord::Base
    has_one :address
end
