class BookPublisher < ActiveRecord::Base
  belongs_to :book
  belongs_to :publisher
end
