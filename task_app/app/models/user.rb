class User < ApplicationRecord
  validates :ttl, :start, :end, presence: true
end
