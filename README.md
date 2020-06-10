Note:

This repo houses the backend code for Hops Along. Please refer here for the project's frontend code and installation instructions. https://github.com/daveholmes88/HopsAlongFrontend

Hops Along:

An application to find breweries in any location in the United States while rating, adding personal notes, and finding a global rating.

Demo:

A video demo of Hops Along is available here https://www.youtube.com/watch?v=zJWot-iI_XQ&t=

Usage and Features:

Hops Along has three main features, the ability to search breweries in any given city or state, the ability to find breweries near you, and the ability to view, rate any brewery, and edit any rating.

Along with that, every user has the ability to create a new brewery and edit existing breweries.

Backend Prerequisites

Rails 6

PostgreSQL

Backend Installation Overview:

After cloning this repo, first run the Rails server:

cd HopsAlongBackend

bundle install

Database installation:

rails db:create

rails db:migrate

rails db:seed

Run Rails server:

rails s