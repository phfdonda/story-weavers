
<!-- PROJECT LOGO -->
<br />
<p align="center">
  <a href="https://github.com/phfdonda/story-weavers">
    <img src="./microverse-logo.jpg" alt="Logo" width="80" height="80" style="border-radius: 10%">
  </a>

  <h3 align="center">Tic-Tac-Toe Game</h3>

  <p align="center">
    This project is part of the Microverse Ruby Section inspired in
    <br />
    <a href="https://www.theodinproject.com/courses/ruby-on-rails">The Odin Project curriculum</a>
    <br />
    <a href="https://github.com/phfdonda/story-weavers/issues">Report Bug</a>
    ·
    <a href="https://github.com/phfdonda/story-weavers/request_feature">Request Feature</a>
  </p>
</p>

## Live Version
[storyWEavers](https://story-weavers.herokuapp.com/)

This is an app deployed in Heroku, so please wait 30 seconds for it to load the first time.

<!-- TABLE OF CONTENTS -->
## Table of Contents

* [About the Project](#about-the-project)
  * [Installation](#installation)
  * [Instructions](#instructions)
  * [Built With](#built-with)
  * [Development Process](#development-process)
  * [Testing](#testing)
* [Contact](#contact)
* [Acknowledgements](#acknowledgements)

<!-- ABOUT THE PROJECT -->
## About The Project

This is my Capstone Project for Ruby on Rails, the final assignment for the RoR course in Microverse curriculum. It is a real-world-like project, meant to emulate the specifications of a real website required by a client. I had to achieve the following aspects:

1. The style should follow this design: [Lifestyle Blog](https://www.behance.net/gallery/14554909/liFEsTlye-Mobile-version), created by [Nelson Sakwa](https://www.behance.net/sakwadesignstudio).
2. It is meant only for desktop browsers, so no responsiveness is required for this project in particular.
3. I should create my own theme for the website.
4. Whatever theme I choose, I should not get too carried away (harder than it seems) - instead, the purpose is to create a MVP version of the app.
5. The database should "reflect" this ERD:
 ![ERD](./docs/ERD__articles.png)
6. The columns names shouldn't be changed.
7. .
8. .


The goals of this project are to:

- Use MVP architectural pattern
- Configure RESTFUL routes
- Use controllers to intercept user requests
- Use view templates for HTML with embedded data
- Use assets pipeline
- Connect Database to app
- Use Active Record:
    - as ORM
    - associations to model real life system (based on Database schema)
    - queries to translate app requirements to SQL queries
    - validations
- Pass user input from view through controller to model in a safe way
- Remember about thin controllers and distinction between logic and presentation tiers
- Avoid n+1 queries problem
- Use unit tests (Rspec)
- Deploy apps (Heroku, Netlify)
- Translate business requirements into software solutions
- Multitask and effectively manage time and prioritization
- Use strong English verbal and written communication
- Communicate information effectively to technical people


## Installation

Ruby is needed to run this file. Follow these steps to install it: 
[TOP - Install Ruby](https://www.theodinproject.com/courses/web-development-101/lessons/installing-ruby)

Rails is also needed. To install it, follow the instructions in this link: [TOP - Install Ruby on Rails](https://www.theodinproject.com/courses/ruby-on-rails/lessons/your-first-rails-application-ruby-on-rails)

You can download the [repo](https://github.com/phfdonda/story-weavers) or clone (paste on the terminal) ```git clone git@github.com:phfdonda/story-weavers.git```

Open the terminal and cd to the path where you download the project. It should be something like: ```User/<folder>/story-weavers/```. 

To open it in your browser, you'll have to set a local server. To do that, in this terminal type ```rails server```, or ```rails s``` for short. By default the port is set to 3000. In your browser url bar, type ```localhost:3000```.

Enjoy!! 

### Built With
This project was built using these technologies.
* Ruby
* Rails
* VsCode
* Rubocop and Stickler for linting

## Development Process
I decided the theme beforehand, as if I was a client passing her business requirements. I decided the name of the website would be storyWEavers.

### Business requirements
The business concept of the website is this: **the same way we programmers can open-source the development of software, with descentralized contribution of the community, what if we could open-source the development of stories?**
My concept is a website where people can write their contributions that, if approved, will be "merged" into the main line of the story. Each chapter is actually a competion of sorts, where people can send their versions. During a timespan, creators can write and publish "threads". The community can vote, propose changes, and if any of the most voted meets the criteria of the editing team, the chapter becomes part of the stream of events.
The website is called storyWEavers because, like weavers, people will contribute with threads. After these threads are woven into a single fabric, we can publish the story - and the profits go to the contributors and the editing team. Since there's no single writer, but many writers called 'weavers', the focus is on the WE. It is a collaborative project of sorts, tapping into the collective creativity. How many great stories can be born like this?

### Translation of business requirements into software design
This is a project created initially as a Capstone Project for the Microverse course - so I have to follow the requirements of the project, at least until it is approved. After that I can take this project to new horizons.
As seen in the ERD, we have to create the following tables:
- Users
- Articles
- Categories
- Votes
However, although it is required of me to create a database that "reflects" this ERD, there is a fundamental flaw in the relationship diagram: we have a many-to-many relationship between Category and Article tables. I have to fix that, and by doing so I no longer "reflect" the ERD. There are two options, if I want to make it as similar as possible: first, I could create a join table to make a "through" relationship; the other one is just changing the many-to-many into one-to-many. The option that is most similar to the ERD is the last one, since we don't have to create a table that isn't there. Also, it better reflects our business requirements: if we consider the "category" a story, and each "article" a chapter, then you can't have a chapter that belongs to many stories, but a story will have many chapters. 


<!-- CONTACT -->
## Contact

Pedro Henrique Ferreira Donda

Github - [@phfhdonda](https://github.com/phfdonda)

LinkedIn - [PedroDonda](https://www.linkedin.com/in/pedro-donda-808621bb/)


<!-- ACKNOWLEDGEMENTS -->
## Acknowledgements
* [Microverse](https://www.microverse.org/)
* [The Odin Project](https://www.theodinproject.com/)
* [Ruby](https://www.ruby-lang.org/en/)
* [Nelson Sakwa](https://www.behance.net/sakwadesignstudio)

