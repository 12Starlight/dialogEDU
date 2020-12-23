@articles.each do |article|
  json.articles do
    json.set! article.id do
      json.partial! 'article', article: article
    end
  end

  json.users do
    json.set! article.author.id do 
      if @user
        json.articleIds @article.ids
      end
      json.partial! 'api/users/user', user: article.author
    end
  end
end