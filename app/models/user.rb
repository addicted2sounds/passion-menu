class User < ApplicationRecord
  def self.from_omniauth(auth)
    find_or_create_by uid: auth['uid'] do |user|
      user.email = auth.dig('info', 'email')
    end
  end
end
