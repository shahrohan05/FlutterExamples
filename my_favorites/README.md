# my_favorites

A sample Flutter project to learn app state management using scoped_model explained in the following tutorial :

- [Simple App State Management](https://flutter.dev/docs/development/data-and-backend/state-mgmt/simple)

-----------------------------------------------------------------------------------------------------------

The app has three screens :
1. Login 
    - User enters his/her name and the user is greeted with toast message (showing if the user is new visitor
    or an existing one). User's favorites list is loaded accordingly.
2. Items List
    - List of random items user can set as favorites and the favorited items can also be removed for each user.
3. Favorites
    - List of favorites items for the user.

The app state maintains the logged in user and his/her favorite items list.