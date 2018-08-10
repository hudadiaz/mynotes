class User < ApplicationRecord
  has_many :notes
  validates :google_uid, presence: true, uniqueness: true

  def self.from_google_oauth2 params
    user = User.find_by(google_uid: params[:google_uid])
    return user if user
    User.create(params)
  end
end
