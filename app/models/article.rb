class Article < ActiveRecord::Base
  before_create :set_url
  belongs_to :category
  has_and_belongs_to_many :tags

  private
  def set_url
    time = Time.now
    self.url = "articles/#{time.month}/#{time.day}/#{time.year}/#{self.title.downcase.gsub(' ', '-')}"
  end
end
