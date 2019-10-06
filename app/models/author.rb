class Author < ActiveRecord::Base
    has_many :booksAuthors
    has_many :books, through: :booksAuthors
end
