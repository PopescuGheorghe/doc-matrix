json.array!(@documents) do |document|
  json.extract! document, :id, :title, :content
  json.url document_url(document, format: :json)
end
