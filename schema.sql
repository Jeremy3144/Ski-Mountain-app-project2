create table users (
  id serial primary key,
  email text,
  password_digest text
);

create table mountains (
  id serial primary key,
  name_of_mt text,
  country text,
  sum_of_mt text,
  terrain_lvl text,
  img_url text,
  fav_run text,
  user_id integer
);


create table votes (
  user_id integer,
  post_id integer,
  vote_type text
);