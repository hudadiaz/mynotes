class Note < ApplicationRecord
  paginates_per 15
  belongs_to :user

  before_create :set_slug

  def display_title
    title || 'Untitled'
  end

  def to_param
    slug
  end

  private

  def set_slug
    while((slug = SecureRandom.uuid) && (Note.find_by(slug: slug))); end
    self.slug = slug
  end
end
