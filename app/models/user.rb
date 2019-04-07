class User < ApplicationRecord
  has_many :alreadies
  validates :name, presence: true, uniqueness: true

  def sign_in
    default_params.permit(:username)
  end

end
