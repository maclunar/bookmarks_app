# Bookmarking Apllication
by [**useomage**](https://github.com/useomage), formerly
[maclunar](https://github.com/maclunar).

## Intro
This is a simple bookmarking application created in Ruby on Rails.

It was created with much help from Rails scaffolding.
New features are added daily.

## Features

### Domains
When adding a bookmark, a domain is automatically extracted from the URL.
Domains can be viewed on their own page, each has it's own ID and each can
have many bookmarks linked to it.

### Short URLs
When adding a bookmark, a short URL is automatically created using Google's
URL shortener. Shortened URL is then stored on each bookmark's page.

### Tags
Each bookmark can have tags assigned to it.
Tags don't provide much functionality so far.

### Users
User accounts can be created.
Bookmarks are now linked to users. User can see all the bookmarks, however,
he can edit and delete only his own.

### Simple navigation
Navigation is streamlined and minimalistic.
Show, Edit and Destroy links generated by scaffolding have been replaced by
links and buttons throughout the application's views.
Each name (bookmark's and domain's) is clickable and it brings the user to
the details page.

### Front-end modifications
* Modals have been implemented to display form for adding new bookmark.
* Simple_forms are used throughout the application to display simple but
pretty-looking forms.
* Bootstrap has been applied more strongly. It is used for pretty much
everything, from fonts and buttons to modals and simple_forms integration.

## Planned features
* Expanding the tagging functionality.
* Improving domain behavior - domain should destroy itself when there are no
  more bookmarks assigned to it.
* Implementing full text search.
* Creating static pages for Home, Contact and About.
* Continued work on front-end, e.g. allowing users to delete their
bookmarks from the index view.
