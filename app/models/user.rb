class User < ApplicationRecord
  validates :first_name, presence: true

  def full_name
    "#{first_name} #{last_name}".strip
  end
end
