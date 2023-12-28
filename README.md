# README

This README would normally document whatever steps are necessary to get the
application up and running.

Commands to setup application:

* Clone of the git repository git clone cloneUrlProvided

* Change directory using cd event_booking_system

* Install Ruby version 2.7.6

* Install Redis Server version 6.2.0

* Install Sidekiq version 6.5.12

* Install gems bundle install

* Setup database rails db:create && rails db:migrate

* run local rails server rails s

* run local redis server with other terminal tab redis-server

* run local sidekiq server with other terminal tab bundle exec sidekiq


Sidekiq:
Since Celery is a Python library used to manage workers, queues, and schedules, I have substituted its functionality with a Sidekiq function. For this reason, we are using the sidekiq and worker at the location of Celery.


SMTP:
I have used the SMTP functionality to send emails to customers informing them of the event and providing confirmation for ticket purchases.

Booking Confirmation Email

* Event Name
* Event Venue
* Event Date
* Ticket Total Price
* Number of Persons


Notification Email for reminder

* Event Name
* Event Venue
* Event Date
* Ticket Total Price
* Number of Persons