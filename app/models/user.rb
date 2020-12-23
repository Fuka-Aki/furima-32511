class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, uniqueness: true
  validates :password,              format: { with: /[a-z\d]{6,}/ }

  with_options presence: true do
    validates :nickname
    validates :last_name,           format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/ }
    validates :first_name,          format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/ }
    validates :last_name_reading,   format: { with: /\A[ァ-ンヴー]+\z/ }
    validates :first_name_reading,  format: { with: /\A[ァ-ンヴー]+\z/ }
    validates :birthday
  end
end