class Document < ActiveRecord::Base
  belongs_to :user

  # ensure that a user_id is present
  validates :user_id, presence: true
  # ensure that title is present and at least 6 chars long
  validates :title, length: { minimum: 6 }, presence: true
  # ensure that content is present and at between 10 and 10000 chars long
  validates :content, length: { minimum: 10, maximum: 10_000 }, presence: true
end
