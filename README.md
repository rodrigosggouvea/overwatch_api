# RodrigoSGGouvea's OverWatch API

This is a Ruby on Rails app developed to consume Blizzard's API for the game Overwatch

You can check it out at https://rodrigosggouveas-overwatch-api.herokuapp.com/api/v1/heros

Project TO-DOs:

* Admin panel;
* Refactor services (so that they fetch and parse data asynchronously via a scheduled job, instead of doing it only if there are any records);

Endpoints:

* Heroes index: https://rodrigosggouveas-overwatch-api.herokuapp.com/api/v1/heros
* Hero's info: https://rodrigosggouveas-overwatch-api.herokuapp.com/api/v1/heros/{:hero_id}
* Hero's abilities index: https://rodrigosggouveas-overwatch-api.herokuapp.com/api/v1/heros/{:hero_id}/abilities
* Abilities index: https://rodrigosggouveas-overwatch-api.herokuapp.com/api/v1/abilities
* Ability's info: https://rodrigosggouveas-overwatch-api.herokuapp.com/api/v1/abilities/{:ability_id}

To run this you need to:

* install Ruby 2.3.1;

* install rvm;

* Clone the project;

* `rvm use 2.3.1@overwatch_api --create`;

* `gem install bundler`;

* `bundle install`;

* `rake db:create db:migrate`;

* `rails s`;

* Voilá!
