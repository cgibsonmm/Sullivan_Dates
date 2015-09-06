class User < ActiveRecord::Base
  validates :name, presence: true, length: { in: 4..55 }
end
