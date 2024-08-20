# README

Coding Challenge API
This project is a Ruby on Rails application designed to meet the requirements of a coding challenge. The application features a RESTful API for managing Vertical, Category, and Course resources, integrated with Elasticsearch for search functionality and OAuth for secure access.

Features
CRUD Operations: Create, Read, Update, and Delete operations for Vertical, Category, and Course models.
Search: Elasticsearch integration for efficient search capabilities.
OAuth Authentication: Secure access to the API using OAuth.
Validation: Uniqueness validation for name fields across Vertical and Category models.
Nested Resources: Updates to parent resources reflect in nested resources.
Requirements

`Ruby 3.0.0 or later` 

`Rails 7.0.0 or later`

`PostgreSQL 13 or later`

`Elasticsearch 7.10 or later`

`Bundler`

#### Clone the Repository
`git clone https://github.com/DamithaPerera/ruby-assignment-.git`

`cd coding_challenge`

##### Install Dependencies
`bundle install`

##### Set Up the Database
`rails db:create`

`rails db:migrate`

##### Seed the Database
`rails db:seed`

##### Start Elasticsearch

##### Start the Rails Server
`rails server`


### API Endpoints


#### Verticals
- **Authorization**: `Bearer {token}`
- **Content-Type**: `application/json`

`GET /api/v1/verticals - List all verticals` 

`POST /api/v1/verticals - Create a new vertical`

`GET /api/v1/verticals/:id - Show a specific vertical`

`PUT /api/v1/verticals/:id - Update a vertical`

`DELETE /api/v1/verticals/:id - Delete a vertical`

##### Categories
- **Authorization**: `Bearer {token}`
- **Content-Type**: `application/json`

`GET /api/v1/verticals/:vertical_id/categories - List all categories under a specific vertical`

`POST /api/v1/verticals/:vertical_id/categories - Create a new category under a specific vertical`

`GET /api/v1/verticals/:vertical_id/categories/:id - Show a specific category`

`PUT /api/v1/verticals/:vertical_id/categories/:id - Update a category`

`DELETE /api/v1/verticals/:vertical_id/categories/:id - Delete a category`

##### Courses
- **Authorization**: `Bearer {token}`
- **Content-Type**: `application/json`

`GET /api/v1/categories/:category_id/courses - List all courses under a specific category`

`POST /api/v1/categories/:category_id/courses - Create a new course under a specific category`

`GET /api/v1/categories/:category_id/courses/:id - Show a specific course`

`PUT /api/v1/categories/:category_id/courses/:id - Update a course`

`DELETE /api/v1/categories/:category_id/courses/:id - Delete a cours`

##### Courses
- **Authorization**: `Bearer {token}`
- **Content-Type**: `application/json`

`GET /api/v1/search?q=progra - List all data under a specific category`

##### Generate Token
`POST /api/v1/auth/sign_in - List all data under a specific category`

- **Content-Type**: `application/json`

#### Body

```json
{
    "email": "admin@example.com",
    "password": "123456"
}
