class Document < ActiveRecord::Base
  belongs_to :user

  # ensure that a user_id is present
  validates :user_id, presence: true
  # ensure that title is present and at least 2 chars long
  validates :title, length: { minimum: 2 }, presence: true
  # ensure that content is present and at between 10 and 10000 chars long
  validates :content, length: { minimum: 10, maximum: 10_000 }, presence: true
  def self.search(search)
    where("content LIKE ?", "%#{search}%")
  end

  #return the occurences of a word
  def self.countOccurences(key)
    result = Hash.new(0)
    Document.all.find_each do |document|
      document.content.split.each do |word|
        result[word] += 1 if word == key
      end
    end
    result[key]
  end
end
