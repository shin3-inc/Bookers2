class Book < ApplicationRecord
	validates :Text, presence: true
	validates :Body, presence: true
end
