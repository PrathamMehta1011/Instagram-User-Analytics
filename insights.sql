use ig_clone;

#Five oldest users on Instagram
select * from users
order by created_at 
limit 5;

#Users without a single posted photo on Instagram
select * from users
left join photos
on users.id = photos.user_id
where photos.id is null;

#Contest - User with most like on a single photo on Instagram
select likes.photo_id, count(likes.photo_id) as likes, photos.user_id,users.username from photos
join likes
on likes.photo_id = photos.id
join users
on users.id = photos.user_id
group by likes.photo_id
order by likes desc
limit 1;



#Top 5 commonly used hastags on Instagram
SELECT tags.tag_name,COUNT(photo_tags.tag_id) as Hastag_usage_count FROM photo_tags
JOIN tags ON photo_tags.tag_id = tags.id
GROUP BY photo_tags.tag_id
order by Hastag_usage_count desc
limit 5;


#Most user registers according days in a week
select dayname(created_at) as creation_date,count(created_at) as total_users_joined from users 
group by creation_date
order by total_users_joined desc;




#Average no. of posts per user
select count(photos.id) as Total_posts, count(distinct users.username) as Total_users, (count(photos.id)/count(distinct users.username)) as Average_post_per_user from users
left join photos
on users.id = photos.user_id;



#Potential identification of bots/fake accounts/dummy accounts
select likes.photo_id, count(likes.photo_id) as likes, photos.user_id,users.username from photos
join likes
on likes.photo_id = photos.id
join users
on users.id = photos.user_id
group by likes.photo_id
order by likes desc;


