class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable :registerable, :recoverable
  devise :database_authenticatable, :rememberable, :validatable
  scope :students, -> { where(:admin => false) }

  has_one :place, dependent: :nullify
  has_one :owned_alliance, foreign_key: "founder_id", class_name: :Aliance, dependent: :destroy
  has_one :primary_claim, foreign_key: "primary_claim_id", class_name: :Place, dependent: :nullify
  has_one :secondary_claim, foreign_key: "secondary_claim_id", class_name: :Place, dependent: :nullify
  belongs_to :aliance, optional: true

  has_one :alliance_membership_request, dependent: :destroy


  def pending_alliance
    self.alliance_membership_request&.aliance
  end
end
