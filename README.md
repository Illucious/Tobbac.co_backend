## Requirement

- Docker
- **use docker-compose up --build to use it using docker**

## Requirement

- Composer
- **PHP 8.1+ & MySQL** or **XAMPP** with `-intl` extension enable

## Configuration

1.  Rename `.env.example` file to `.env`.
2.  Set the jwt secretkey and token expiration in the `.env` file if you want to change them.
3.  Install dependencies:
```shell
    composer install
```
4. Create `db_online_auction` database
5.  Ensure your database is setup correctly, then run the migrations: 
```shell
    php spark migrate -all  
```
6.  Run the app: 
```shell
    php spark serve  
```

> http://localhost:8080

## API Reference

#### Login

```
POST   /api/login
```

| Parameter  | Type     | Description                 |
| :--------  | :------- | :-------------------------  |
| `username` | `string` | **Required**. Your username |
| `password` | `string` | **Required**. Your password |


#### Register user

```
POST   /api/users
```

| Parameter      | Type     | Description    |
| :--------      | :------- | :--------------|
| `username`     | `string` | **Required**.  |
| `password`     | `string` | **Required**.  |
| `name`         | `string` | **Required**.  |
| `email`        | `string` | **Required**.  |
| `phone`        | `string` |                |

---
Warning :warning: Make sure to add authorization header (Bearer token)

#### Get auction

```
GET    /api/auctions
```
```
GET    /api/auctions/{id}
```
#### Get user/my auctions
```
GET    /api/users/auctions
```
#### Get auction bids
```
GET    /api/auctions/{id}/bids
```
---
#### Create an auction
```
POST   /api/auctions
```
#### Update an auction
```
PATCH  /api/auctions/{id}
```
#### Set winner & close auction
```
PATCH  /api/auctions/{id}/winner
```
```
PATCH  /api/auctions/{id}/close
```
#### Delete an auction
```
DELETE /api/auctions/{id}
```
---
#### Get bid
```
GET    /api/bids
```
```
GET    /api/bids/{id}
```
#### Get user/my bids
```
GET    /api/users/bids
```
---
#### Create/place a bid
```
POST   /api/bids
```
#### Update bid
```
PATCH  /api/bids/{id}
```
#### Delete bid
```
DELETE /api/bids/{id}
```
---
#### Get item
```
GET    /api/items
```
```
GET    /api/items/{id}
```
#### Create an item
```
POST   /api/items
```
#### Update an item
```
PATCH  /api/items/{id}
```
#### Delete an item
```
DELETE /api/items{id}
```
---
#### Get user
```
GET    /api/users
```
```
GET    /api/users/{id}
```
#### Update user
```
PATCH  /api/users/{id}
```
#### Delete user
```
DELETE /api/users/{id}
```





