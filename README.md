![](https://img.shields.io/badge/Microverse-blueviolet)
# Blog App - Ruby on Rails

The Blog app is a classic example of a blog website. It is a fully functional website that shows the list of posts and empower readers to interact with them by adding comments and liking posts.

## Screenshot

![Blog App root](https://raw.githubusercontent.com/ArthurGC/blog-app-project/setup-mailer/app/assets/images/FireShot_Capture_002_BlogAppProject_blog-app-arthurgca-herokuapp-com.png)

## :hammer: Preview

- [Preview App](https://blog-app-arthurgca.herokuapp.com/)

## :hammer: Built With

- Ruby on Rails
- Bootstrap
- Heroku

To get a local copy up and running follow these simple steps:

**First Steps**

1. Clone it using git command:
```ruby
git clone https://github.com/ArthurGC/blog-app-project.git
```

**Run in development (locally)**

1. Install gem files and dependencies:
```ruby
bundle install
```
```ruby
yarn install
```
2. Setup you database.yml with your own postgres's password or create a PASS_POSTGRES environment variable 
```ruby
  password: <%= ENV["PASS_POSTGRESQL"] %>
```
4. Setup db and seed file
```ruby
rails db:setup
```
```ruby
rails db:seed
```
5. Run server
```ruby
rails server
```
[OPTIONAL] if you receive an error about turbolinks or application.(css/js) after running the server. Please use this command before run the server:
```ruby
rails assets:precompile
```

**Run tests**

1. To run all tests in the project
```ruby
rspec
``` 
If you wanna run a certain test file
```ruby
rspec spec/test_file_path
```

## :blue_book: Learning Objectives

- Use controllers to handle requests and render empty views.
- Install Ruby on Rails framework.
- Use Ruby Gems as a software packages system.
- Understand Rails naming conventions.
- Use params from browser requests in a safe way.

## Authors

👤 **ArthurGC**

- GitHub: [@ArthurGC](https://github.com/ArthurGC)
- Twitter: [@ArthurGC_22](https://twitter.com/ArthurGC_22)
- LinkedIn: [alxguzmanc](https://www.linkedin.com/in/alxguzmanc/)

👤 **Guilherme Giachellin**

- GitHub: [@GuilhermeGiachellin](https://github.com/GuilhermeGiachellin)
- LinkedIn: [GuilhermeGiachellin](https://www.linkedin.com/in/guilherme-giachellin-2599771b9/)

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/ArthurGC/blog-app-project/issues).

## Show your support

Give a ⭐️ if you like this project!

## 📝 License

This project is [MIT](LICENSE) licensed.

