class Book < ApplicationRecord

  belongs_to :user, optional: true

   validates :title, presence: true ,allow_nil: true
   validates :body, presence: true, uniqueness: true, length: { maximum: 200 } ,allow_nil: true

end
