# == Schema Information
#
# Table name: shortened_urls
#
#  id         :integer          not null, primary key
#  short_url  :string           not null
#  long_url   :string           not null
#  author_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ShortenedUrl < ApplicationRecord
  validates :short_url, presence: true, uniqueness: true

  def self.random_code
    found = false
    until found
      cur = SecureRandom.urlsafe_base64
      if ShortenedUrl.exists?(cur)
        
      else
        found = true 
        return cur
      end
    end
  end

  def self.shorten(user, long_url)
    short = self.random_code
    ShortenedUrl.new(long_url: long_url, short_url: short, author_id: user.id )
  end

  belongs_to :submitter,
    primary_key: :id,
    foreign_key: :author_id,
    class_name: :User
end
