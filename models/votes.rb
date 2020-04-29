

def add_vote(user_id, id, vote_type)
  sql = "insert into votes (user_id, post_id, vote_type) values ($1, $2, $3);"
  run_sql(sql, [user_id, id, vote_type])
end

