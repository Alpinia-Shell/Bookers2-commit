class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :books, dependent: :destroy
  has_one_attached :profile_image
  validates :name,length:{minimum:2,maximum:20},uniqueness:true
  validates :introduction,length:{maximum:50}

  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/No_Image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'no-image.jpg', content_type: 'image/jpg')
    end  
    profile_image.variant(resize_to_limit: [width, height]).processed
  end
end
