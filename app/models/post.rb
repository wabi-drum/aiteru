class Post < ApplicationRecord
  
  has_one_attached :image

  belongs_to :user

  validates :title, presence: true
  validates :body, presence: true
  validates :image, presence: true 

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(gravity: :center, resize: "#{width}x#{height}^", crop: "#{width}x#{height}+0+0")
  end
  
end
