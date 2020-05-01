def add_comment(user_id, post_id, comment)
  sql = "insert into comments (user_id, post_id, comment) values ($1, $2, $3);"
  run_sql(sql, [user_id, post_id, comment])
end

def delete_comment_by_id(id)
  sql = "delete from comments where id = $1;"
  run_sql(sql, [id])
end

def get_comments_by_post_id(post_id)
  sql = "select * from comments where post_id = $1"
  run_sql(sql, [post_id])
end