# Week 5 - MakersBnB**
We would like a web application that allows users to list spaces they have available, and to hire spaces for the night.

## How to set up a development database
1. Connect to ```psql```
2. Create a database using the ```psql``` command ```CREATE DATABASE makersbnb```;
3. Connect to the database using the ```psql``` command ```\c makersbnb;```
4. Run the query we saved in the file: ```./db/migrations/01_create_listings_table.sql```

----

## Headline specifications
- Any signed-up user can list a new space.
- Users can list multiple spaces.
- Users should be able to name their space, provide a short description of the space, and a price per night.
- Users should be able to offer a range of dates where their space is available.
- Any signed-up user can request to hire any space for one night, and this should be approved by the user that owns that space.
- Nights for which a space has already been booked should not be available for users to book that space.
- Until a user has confirmed a booking request, that space can still be booked for that night.

## User Stories
**Spec:** Any signed-up user can list a new space.
```
1:
As a User
So that I can rent out my space 
I want to be able to sign up and then create a listing
```

**Spec:** Users can list multiple spaces.
``` 
2:
As a User
So that I can rent out more than one space
I want to be able to list multiple spaces at a time
```

**Spec:** Users should be able to name their space, provide a short description of the space, and a price per night.
```
3:
As a User
So that I can advertise my space
I'd like to be able to give it a name, description and price per night
```
**Spec:** Users should be able to offer a range of dates where their space is available.
```
4:
As a User
So that I can show the availability
I'd like to include a range of dates the space is vacant
```

**Spec:** Any signed-up user can request to hire any space for one night, and this should be approved by the user that owns that space.

```
5:
As a User
So that I can only have bookings i'm happy with
I want to be able to approve a booking
```
```
6:
As a Customer
So that I can hire a space
I want to be able to request a booking
```
**Spec:** Nights for which a space has already been booked should not be available for users to book that space.
```
As a User
So that I can prevent double bookings
I want to only show bookings with available dates
```
**Spec:** Until a user has confirmed a booking request, that space can still be booked for that night.
```
As a User
So that I can keep my listing available until booked
I want confirmation of the booking 
```

## MVP
- User can sign up
- User can list a space
- User can see that space

<br>

----
<br>

## Tickets for our MVP

```
1:
As a User
So that I can rent out my space 
I want to be able to sign up and then create a listing
```
**Ticket 1:** Sign up to the website [Jane & Shirley]
**Ticket 2:** Create a listing [Camilla & Chloe]

```
3:
As a User
So that I can advertise my space
I'd like to be able to give it a name, description and price per night
```
**Ticket 3:** Add on detail functionality for the listing [database]

``` 
2:
As a User
So that I can rent out more than one space
I want to be able to list multiple spaces at a time
```
**Ticket 4:** 

----


### Footer links:
Photo by <a href="https://unsplash.com/@rpnickson?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Roberto Nickson</a> on <a href="https://unsplash.com/s/photos/woodland-cottage?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Unsplash</a>
  