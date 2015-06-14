class Document < ActiveRecord::Base
  belongs_to :user

  has_paper_trail

  # ensure that a user_id is present
  validates :user_id, presence: true
  # ensure that title is present
  validates :title, presence: true
  # ensure that content is present
  validates :content, presence: true

  #return the documents wich contain the searched word
  def self.search(search)
    where("content LIKE ?", "%#{search}%")
  end

  #return the occurences of a word
  #it's case insensitive
  #doesn't return the edited words like blod,italic
  def self.count_occurences(key)
    re = /<("[^"]*"|'[^']*'|[^'">])*>/
    result = Hash.new(0)
    @tmp = ''
    Document.all.find_each do |document|
      document.content.split.each do |word|
        word = word.gsub(re, '')
        if word.downcase == key.downcase
          result[word] += 1
          @tmp = word
        end
      end
    end
    result[@tmp]
  end
end
