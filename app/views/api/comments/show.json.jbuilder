json.comment do 
  json.partial! "comment", comment: @comment 
end

json.user do 
  json.partial! "/api/users/user", user: @comment.author 
end 




