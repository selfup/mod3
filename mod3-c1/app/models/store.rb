class Store < ActiveRecord::Base
  has_many :items

  validates :slug, uniqueness: true, presence: true
  validates :name, presence: true

  before_validation :generate_slug

  # This will generate the slug and parameterize it for you
  def generate_slug
    self.slug = name.parameterize
  end

end
