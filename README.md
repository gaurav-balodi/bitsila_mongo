# README

## Restaurant Data:
```
Zomato:
https://www.zomato.com/bangalore/chef-bakers-5-marathahalli-bangalore/order
https://www.zomato.com/bangalore/chef-bakers-1-sarjapur-road-bangalore/order
https://www.zomato.com/bangalore/dominos-pizza-koramangala-5th-block-bangalore/order
Swiggy:
https://www.swiggy.com/restaurants/chef-bakers-chamundeswari-layout-vidyaranyapura-bangalore-352506
MagicPin - bit easy to scrape it from
https://magicpin.in/Hyderabad/Miyapur/Restaurant/Chef-Bakers/store/55b016/delivery/
```

Scrape restaurant Data for the given set of URLs(these can be added from backend on a regular basis) from either Swiggy | Zomato | MagicPin and Store it in the Database. Any two sources you can choose to scrape the data. If more URLs are added, it should fetch the data for those restaurants and store it automatically. At a high level you'll be storing the data in Location, Restaurant, Category and Products | Order / Order Items Tables or whatever you think it's appropriate. Keep the data in sync with all the URLs on a weekly basis or on a need basis manual sync can be initiated. Whenever Store Catalog is updated, merge with the latest data. See if you can avoid not creating duplicate Stores across all the URLs.

## Crawlers

1. Crawlers are put in the app/crawlers folder
2. For each of the crawlers another folder called pages has been put inside the app/crawlers folder, to better deal details from pages parsed from the zomato, swiggy etc. sources

### Develop APIs for the following:
1. Discovering the Restaurants by Location | Type of Restaurant
2. Show Restaurant’s Categories with no. of items, avg price, min and max price of that category items
a. Search within a Restaurant
3. Show Products of the Category
4. Show Product in Detail
5. A simple Ordering API & Offers 

Document the above code in POSTMAN and Host your Code anywhere - like Heroko, Render, AWS or anything that you are comfortable with. (If you are not able to host it, demo from your local setup).
```
https://devcenter.heroku.com/articles/getting-started-with-rails6
https://devcenter.heroku.com/articles/getting-started-with-rails7 
```
Use the GitLab | GitHub | BitBucket to push your code with complete commit notes for each of the APIs. 

Develop a Simple UI to demonstrate the usage of the above APIs.

You can choose the latest Ruby 3.x and Rails 7.x framework, any database MySQL/Postgres/Sqlite3.
Any frontend framework if you want to choose, you can choose whatever you are comfortable with!

#### Once the work is done reply to the same email with the following details:
`Git URL
POSTMAN collection 
Hosted application URL
A short video demo of the APIs, Schema and your approach and the UI developed with an explanation`

#### Test Evaluation is based on the:
1. Design it for dealing with 1 million Restaurants and 500 items per restaurant
2. Scraping & Merging Logic
3. Database design
4. APIs
5. Defect Free Code
6. Good UI is a plus.
