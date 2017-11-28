# RodrigoSGGouvea's OverWatch API

This is a Ruby on Rails app developed to consume Blizard's API for the game Overwatch

You can check it out at https://rodrigosggouveas-overwatch-api.herokuapp.com/api/v1/heros

Endpoints:

* Heroes index: https://rodrigosggouveas-overwatch-api.herokuapp.com/api/v1/heros
* Hero's info: https://rodrigosggouveas-overwatch-api.herokuapp.com/api/v1/heros/{:hero_id}
* Hero's abilities index: https://rodrigosggouveas-overwatch-api.herokuapp.com/api/v1/heros/{:hero_id}/abilities
* Abilities index: https://rodrigosggouveas-overwatch-api.herokuapp.com/api/v1/abilities
* Ability's info: https://rodrigosggouveas-overwatch-api.herokuapp.com/api/v1/abilities/{:ability_id}

To run this you need to:

* Clone the project;

* `bundle install`

* `rake db:create db:migrate`

* `rails s`

* Voilá!
