Devise Marketable
===================

> If this person turns out to be our best customer, we want to know where they came from. 

> **Mike McDerment**, CEO of FreshBooks 

Devise Marketable lets you easily store where your user came from and where they were going in your Rails app.


## Background

Mike McDerment is part of that small handful of entrepreneurs who have tremendously inspired my work. He started a web app, and even past 30 years old, was cranking away at in his parents' basement for 3 years. Plenty of smart people told him what he was working on was stupid and would fail. And, yet, he continued. Today, FreshBooks is a very successful company. 

Mike is a huge proponent of tracking where your customers came from and where they were going. With this data, you can figure out what kind of marketing is working and what's not. 

When I say marketing, I'm referring to everything related to getting customers, not just spending money on advertising. If you get an influx of new users, wouldn't you want to know if they came from a blog post you wrote, or someone mentioned you on Reddit? If you found out Reddit is your best source of new paying customers, then you've figured out where to best allocate your resources to get even more customers. 

It's super easy to capture this data, but most of us don't, because it's even more friction to getting features done for our customers. Or we rely on 3rd party analytics tools. Some are great, but what happens when you want to switch analytics tools or do something custom they can't do. Then your data is locked up.

I created Devise Marketable to automatically track the most basic and important marketing data we should be tracking alongside our User data (using [Devise](https://github.com/plataformatec/devise)) in our own database. (And so that I could add it to [Draft](http://draftin.com), a tool I've created to help people [write better](http://draftin.com).)

 
Installation
------------

1) Add 'devise_marketable' to your Gemfile. 

```
gem 'devise_marketable'
```

2) Run `bundle install`
3) Add the marketing fields to your user table: 

```
rails g devise_marketable YOUR_USER_MODEL
```

YOUR_USER_MODEL is probably User. It's what you attach Devise to. (e.g. User, Admin, Account)

```
rails g devise_marketable User
```

4) Run your migration

```
rake db:migrate
```

5) Make your devise model "marketable"

```
devise :database_authenticatable, ..., :marketable
```

6) Restart your server

------------

Devise will now automatically create 2 cookies for your users, the referring_url (where they came from) and the landing_url (where they were going). When the user registers with your application, the values in those cookies are stored alongside your user data. 

That's it. You now have some very powerful data to figure out: where your best customers come from, what traffic sources are your most lucrative, what on your website converts the best, what people are most interested in, etc. 

Here's a great and short presentation from Mike on tracking user metrics. 

[http://vimeo.com/10733370](http://vimeo.com/10733370)


Feedback
--------
[Source code available on Github](https://github.com/n8/devise_marketable). Feedback and pull requests are greatly appreciated.  Let me know if I can improve this.

-----------

P.S. [**I'd love to meet you on Twitter: here**](http://twitter.com/natekontny). 