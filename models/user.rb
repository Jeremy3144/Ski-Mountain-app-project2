require 'bcrypt'


def create_user(email, password)
  password_digest = BCrypt::Password.create(password)
  sql = "insert into users (email, password_digest) values ($1, $2);"
  run_sql(sql, [email, password_digest])
end

def find_one_user_by_id(id)
  sql = "SELECT * FROM users where id = $1;"
  run_sql(sql, [id])[0]
end

def find_one_user_by_email(email)
  sql = "SELECT * FROM users where email = $1;"
  records = run_sql(sql, [email])
  if records.count == 0
    return nil
  else  
    return records[0]
  end
end
