# Bookmarking Apllication
by **maclunar**

## Intro
This is a simple bookmarking application created in Ruby on Rails.

## Goals
1. add new bookmarks
1. extract and store domain from bookmark's url
1. display all bookmarks from given domain
1. add tags to bookmarks
1. add short links
1. add search

## Completed
1. User can add new bookmarks
1. The domain is automaticaly extracted from a bookmark.
1. Short links are automaticaly generated.

## Issues
* Tags. Implementation seems to be there, but the tags
	are not showing up corrently in the Show view for Bookmarks.
* In Show Domain all the bookmarks are listed, instead of just the ones
	that belong to the domain.
* Domain should destroy itself if there are no bookmarks belonging to it.
