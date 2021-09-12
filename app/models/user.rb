class User < ApplicationRecord
has_person_name

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_create :welcome_send

  has_many :appointments, dependent: :destroy
  has_many :services, through: :appointments

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
end
