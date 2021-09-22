# Makers Bnb

## Intro

This project is a basic mock up of AirBnB. Some of the code will be taken from a group project I did earlier in the course, which can be found here: https://github.com/karimabuseer/makersbnb.

### Set Up

- Set up makersbnb and makersbnb_test databases. In psql
```
CREATE DATABASE makersbnb;
CREATE DATABASE makersbnb_test;
```
- Run SQL queries savesdin db/migrations to set up both databases with the tables

### User Stories

```
As a user
So I can list/book spaces
I would like to be able to sign up, log in and out
```

**Criteria to meet:**
- User can sign up and the data will persist
- User can log in if they have signed up
  - Will throw error if email and password do not match up
- User can log out and the session will be cleared

  **Extra features to add:**
    - Scramble user password for increased security ✅
    - Hide password when typing in ✅
      - With option to view it 🔜
    - Don't let someone sign up if email is already in use ✅
    - Tell user if the email is not in the system and ask them to either check it or sign up ✅
    - Won't let user sign in if a user is already logged in ✅

```
As a host
So I can advertise spaces								
I would like to post ‘spaces’ (with a name, short description and price per night)
```

**Criteria to meet:**
- User can list a space and it will show up on listings page ✅
- User can add name, description and price ✅
- The listing is linked to the user ✅
- Clicking on the listing will take you to a page with all the details on ✅

  **Extra features to add:**
    - User can add a picture of their space
    - User has to fill in all the fields when listing a space
    - A user can remove a listing


```
As a guest
So I can book a place
I would like to request it for some given dates
```

**Criteria to meet**
- A user can click on 'request to book' and fill in some dates
- Users can visit their profile and it will tell them what they have requested to book, the dates and whether it is 
confirmed or not


