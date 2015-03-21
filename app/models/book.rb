class Book < ActiveRecord::Base
  validates :title, presence: true
  belongs_to :author
end
