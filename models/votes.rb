

def add_vote(user_id, id, vote_type)
  sql = "insert into votes (user_id, post_id, vote_type) values ($1, $2, $3);"
  run_sql(sql, [user_id, id, vote_type])
end

def get_votes_by_post_id(id)
  sql = "select * from votes where post_id = $1;"
  run_sql(sql, [id])[0]
end

def get_result_of_votes_by_post_id(id)
  up_vote = run_sql("select count(*) from votes where post_id = $1 and vote_type = 'up';", [id])[0]["count"].to_i

  down_vote = run_sql("select count(*) from votes where post_id = $1 and vote_type = 'down';", [id])[0]["count"].to_i


  result = up_vote - down_vote
end
 
def user_voted?(user_id, post_id)
  sql = "select * from votes where user_id = $1 and post_id = $2;"
  result = run_sql(sql, [user_id, post_id])

  if result.count > 0 
    return true
  else 
    return false
  end
end