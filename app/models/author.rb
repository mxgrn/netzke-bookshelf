class Author < ActiveRecord::Base
  validates :name, presence: true
  has_many :books, dependent: :delete_all
end
