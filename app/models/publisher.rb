class Publisher < ActiveRecord::Base
    has_many :bookPublishers
    has_many :books, through: :bookPublishers
end
