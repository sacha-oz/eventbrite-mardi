class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
	validates :email,
      presence: true, #tjr rempli
      uniqueness: true,  #unique
      format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email adress please" } #format
    validates :first_name,
      presence: true
    validates :last_name,
      presence: true
    validates :description,
      presence: true
    validates :encrypted_password, 
      presence: true,
      length: { minimum: 6 }
    after_create :welcome_send 
    
    has_many :events, foreign_key: 'admin_id', class_name: "Event"
    has_many :attendances
    has_many :events, through: :attendances


    def welcome_send
      UserMailer.welcome_email(self).deliver_now
    end
end
