json.extract! book, :id, :Title, :Body, :created_at, :updated_at
json.url book_url(book, format: :json)
