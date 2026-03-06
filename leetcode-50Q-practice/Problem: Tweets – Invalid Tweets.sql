Table: Tweets

tweet_id (int, PK)

content (varchar)

Goal: Find the IDs of tweets where the content length is strictly greater than 15.

Solution
SELECT tweet_id
FROM Tweets
WHERE LENGTH(content) > 15;
