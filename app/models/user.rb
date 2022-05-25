class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :pic, attached: true, content_type: ['image/png', 'image/jpg', 'image/jpeg'], size: {between: 1.kilobyte..3.megabytes, message: 'is not given between size'}

  after_create :assign_default_address

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many_attached :pic
  has_many :addresses, dependent: :destroy
  accepts_nested_attributes_for :addresses

  def default_address
    Address.new(address: "Bacancy(Company Address)", city: "Ahmedabad", state: "Gujarat")
  end

  private
      def assign_default_address
        self.addresses << default_address
      end
end
