#Document
class Document < ActiveRecord::Base
  belongs_to :user

  has_paper_trail

  # ensure that a user_id is present
  validates :user_id, presence: true
  # ensure that title is present and unique
  validates :title, presence: true, uniqueness: true
  # ensure that content is present
  validates :content, presence: true

  #return the documents wich contain the searched word
  def self.search(search)
    where("content LIKE ?", "%#{search}%")
  end

  #return the occurences of a word in all documents
  #it's case insensitive
  def self.count_occurences(key)
    re = /<("[^"]*"|'[^']*'|[^'">])*>/
    result = Hash.new(0)
    Document.all.find_each do |document|
      document.content.split.each do |word|
        word = word.gsub(re, '')
        result[key] += 1 if word.downcase == key.downcase
      end
    end
    result[key]
  end
end
