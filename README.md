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
      - With option to view it
    - Don't let someone sign up if email is already in use ✅
    - Tell user if the email is not in the system and ask them to either check it or sign up ✅
    - Won't let user sign in if a user is already logged in ✅