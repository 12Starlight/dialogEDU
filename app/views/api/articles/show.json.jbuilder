json.article do
  json.partial! '/api/articles/article', article: @article
end

json.user do
  json.partial! '/api/users/user', user: @article.author
end





