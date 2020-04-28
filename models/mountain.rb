

def get_all_mountains()
  sql = "select * from mountains;"
  run_sql(sql, [])[0]
end

def get_one_mountain_by_id(id)
  sql = "select * from mountains where id = $1;"
  run_sql(sql, [id])[0]
end

def create_mountain(name_of_mt, country, sum_of_mt, terrain_lvl, mt_category, fav_run, user_id, rating)

  sql = "insert into mountains (name_of_mt, country, sum_of_mt, terrain_lvl, mt_category, fav_run, user_id, rating) values ($1, $2, $3, $4, $5, $6, $7, $8);"

  run_sql(sql, [name_of_mt, country, sum_of_mt, terrain_lvl, mt_category, fav_run, user_id, rating])
end 

def update_mountain(id, name_of_mt, country, sum_of_mt, terrain_lvl, mt_category, fav_run, rating)

  sql = "update mountains set name_of_m = $2, country = $3, sum_of_mt = $4, terrain_lvl = $5, mt_category = $6, fav_run = $7, rating = $8 where id = $1;"

  run_sql(sql, [id, name_of_mt, country, sum_of_mt, terrain_lvl, mt_category, fav_run, rating])
end

def delete_mountain(id)
  sql = "delete from mountains where id = $1;"
  run_sql(sql, [id])
end