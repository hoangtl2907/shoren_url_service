# Tech stack
- Ruby: 3.2.2
- Rails: 7.0.6
- Database: postgres 15.3

# Easy setup via docker
- Step 1: Clone the repo
  ```
  git clone git@github.com:hoangtl2907/shorten_url.git
  ```
- Step 2: Build up docker container and run
  ```
  docker compose up -d
  ```
- Step 3: Run rails server
  ```
  docker exec -it shorten_url_service rails s -b '0.0.0.0'
  ```
- Step 4: Now you can try it out with `localhost:3000`, it will lead you to the API document. You can try the API here
<img width="1792" alt="Screenshot 2023-07-15 at 17 18 44" src="https://github.com/hoangtl2907/shorten_url/assets/15981782/cf1dcd85-db9b-4a06-b98a-7dd4536bf5d7">

# Real life problem
But in real life, there may be billions of records, hundred thousands of requests per minute. Scaling up a monolithic system will soon reach limitation and it is not enough to handle a vast number of requests. So we should scale out a distributed system.

# Distribute the system
## Multiple services
In order to scale out more services, we should have a load balancer to balance the requests among services
## Database sharding
There are two ways for sharding the database, we can use either range or hash.
- Range: In this service, I generate a unique id for an url by using base32 decoding sequential numbers. So we can split it into many smaller range: 1..1000000, 1000001..2000000,...
- Hash: For each database, we can create a unique hash and include it in the id of the url
## System Overview
![shorten_url](https://github.com/hoangtl2907/shorten_url/assets/15981782/858fbff8-c626-4f04-96c0-5ad10b96a4cf)
## Other improvement: generate and look up data
- In order to speed up generating process, we can generate a list of unique IDs in advance and assign it to a request when the request comes. Generating in advance will help to reduce indexing and constraint checking time.
- For indexing generated ID, the postgres default index is btree, we can use hash instead. It has better performance and uses less storage. But hash index has a limit of 2^32-1 unique hash code, so should not let the database be too big or the hash code can be duplicated
