
def run_sql(sql, params = [ ])
  # conn = PG.connect(dbname: 'skimountains')
  conn = PG.connect(ENV['DATABASE_URL'] || {dbname: 'skimountains'})
  records = conn.exec_params(sql, params)
  conn.close
  records
end

def logged_in?
  !!session[:user_id]
end
