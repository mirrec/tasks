# All TODO lists suck. This one sucks less.

![out](https://cloud.githubusercontent.com/assets/522375/6764046/83d838f0-cf9c-11e4-8a6d-ed9057c4c708.gif)


## Technical stack

This project is build with Ruby on Rails. It is heavily AJAXified and leverages [turbolinks](https://github.com/rails/turbolinks), [jquery-ujs](https://github.com/rails/jquery-ujs) and [Server-generated JavaScript Responses (SJR)](https://signalvnoise.com/posts/3697-server-generated-javascript-responses). To put it straight: I REALLY like SJR. This concept is awesome, powerful and really easy to use.

## Local development setup

```
git clone https://github.com/mrhead/tasks
cd tasks
bundle install
rake db:create db:setup # you need postgresql installed
rails s
```

Go to [http://localhost:3000](http://localhost:3000) and log in as `user@example.com` with password `password`.

## Deploying to heroku

```
git clone https://github.com/mrhead/tasks
cd tasks
heroku apps:create [your-app-name]
git push heroku master
heroku run rake db:migrate
heroku open
```
