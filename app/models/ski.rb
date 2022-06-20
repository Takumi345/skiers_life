class Ski < ApplicationRecord

  has_one_attached :image
  belongs_to :user, optional: true
  belongs_to :genre, optional: true
  has_many :ski_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  scope :search, -> (search_params) do
    return if search_params.blank?
      genre_id_is(search_params[:genre_id])
    end
  scope :genre_id_is, -> (genre_id) { where(genre_id: genre_id) if genre_id.present? }

end