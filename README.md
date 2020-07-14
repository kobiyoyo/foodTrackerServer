<br />
<p align="center">
  <h1 align="center">Tracker Api</h1>

  <p align="center">
    A Ruby on Rails application
    <br />
    <br />
    <a href="https://powerful-escarpment-41375.herokuapp.com/login">View Demo</a>
    ·
    <a href="https://github.com/kobiyoyo/foodTrackerServer/issues">Report Bug</a>
    ·
    <a href="https://github.com/kobiyoyo/foodTrackerServer/issues">Request Feature</a>
  </p>




  <p>
  	<a href="https://codeclimate.com/github/kobiyoyo/foodTrackerServer/maintainability"><img src="https://api.codeclimate.com/v1/badges/f575ff8963bf183eb988/maintainability" /></a>
  	<a href="https://codeclimate.com/github/kobiyoyo/foodTrackerServer/test_coverage"><img src="https://api.codeclimate.com/v1/badges/f575ff8963bf183eb988/test_coverage" /></a>
  </p>
 
</p>



## Description
This is a food intake tracker API, which can be used to track the amount of food taken at a specified moment time. This food is managed by the administrator user.

## Built With
- Ruby 
- Ruby on Rails
- Bulma
- Bullet
- Rubocop
- PostgreSQL

## Features
- Users can create an account and sign in.
- Users can add measurements.
- Users can edit measurements.
- Users can delete measurements.
- Admin users can add intake.
- Admin users can edit intake.
- Admin users can delete intake.






## Requests
 These are the HTTP request methods used in this project:

| Method   | Action                                                      |
|---       | ---                                                         |
| `GET`    | This method is used to *get* a resource                     |
| `POST`   | This method is used to *create* a resource or *send* data   |
| `PATCH`  | This method is used to *update* a resource                  |
| `DELETE` | This method is used to *delete* a resource                  |

## Routes

The routes featured in this project:

| API routes(url)       | Method   | Description                                         |
| ---                   | ---      | ---                                                 |
| /auth/signup   | `POST`   | For user to create an account                  |
| /auth/signin   | `POST`   | For a user to log in to an account                  |
| /api/v1/user/:id    | `PATCH` | For a user to edit his/her account                   |
| /api/v1/user/:id    | `DELETE` | For a user to delete his/her account                   |
| /api/v1/intakes      | `POST`   | For a user to create an intake                    |
| /api/v1/intakes      | `GET`   | For a user to get all  intakes                    |
| /api/v1/intakes/:id      | `PATCH`   | For a user to edit an intake                    |
| /api/v1/intakes/:id      | `DELETE`   | For a user to delete an intake                    |
| /api/v1/intakes/:id/measurements     | `POST`   | For a user to create measurement                    |
| /api/v1/intakes/:id/measurements     | `GET`   | For a user to get all  measurements                   |
| /api/v1/intakes/:id/measurements/:id      | `PATCH`   | For a user to edit measurement                    |
| /api/v1/intakes/:id/measurements/:id      | `DELETE`   | For a user to delete measurement                    |


<hr>

## Live Demo
[Live Demo Link](https://powerful-escarpment-41375.herokuapp.com/login)
## Usage

> Clone the repository to your local machine

```sh
$ git clone https://github.com/kobiyoyo/foodTrackerServer/.git
```

> cd into the directory

```sh
$ bundle install --without production
```


> Next,create & migrate the database:
```
$ rails db:create

$ rails db:migrate
```

> Run the app in a local server:

```
$ rails server
```
> Finally, run the test suite to verify that everything is working correctly:

```
$ rspec
```
> You can then drop into rails console to explore the models

```sh
$ cd rails c
```
## Contributors

* [Adama Chubiyojo Desmond](https://github.com/kobiyoyo)

## Contributing

1. Fork it (https://github.com/kobiyoyo/foodTrackerServer/fork)
2. Create your feature branch (git checkout -b feature/[choose-a-name])
3. Commit your changes (git commit -am 'what this commit will fix/add')
4. Push to the branch (git push origin feature/[chosen-name])
5. Create a new Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](./LICENSE) file for details
 






