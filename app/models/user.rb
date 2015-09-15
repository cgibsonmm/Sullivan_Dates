class User < ActiveRecord::Base
  before_save { email.downcase! }
  validates :first_name, presence: true, length: { in: 3..55 }
  validates :last_name, presence: true, length: {in: 3..55 }
  VALID_EMAIL_REGREX = /\A[\w+\-.]+@[a-z\d]+(\.[a-z\d-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 }, format:{ with: VALID_EMAIL_REGREX}, uniqueness: {case_sensitive: false}
  validates :zip_code, presence: true, length: {is: 5}
  validates :Zip, inclusion: {in: 12701..12795, message: " - You must live in Sullivan County."}

  def Zip
    zip = zip_code.to_i
  end

end
