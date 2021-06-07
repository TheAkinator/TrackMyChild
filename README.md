
![Track my child](https://user-images.githubusercontent.com/13472264/120946322-6f905200-c712-11eb-9329-19bc5b4f2328.png)
# Track My Child

This is a project for a interview test that is basically a virtual check in.
Here a teachers can manage all the childs in their classroom, checking them in or out
and even changing them from classroom.

## Screenshots
Login            |  Home     |  Children
:-------------------------:|:-------------------------:|:-------------------------:
![Simulator Screen Shot - iPhone 12 Pro Max - 2021-06-06 at 21 28 46 (1)](https://user-images.githubusercontent.com/13472264/120945178-7a48e800-c70e-11eb-8e86-454b1dddfb8e.jpg) | ![Simulator Screen Shot - iPhone 12 Pro Max - 2021-06-06 at 21 28 26](https://user-images.githubusercontent.com/13472264/120945272-d01d9000-c70e-11eb-965c-80e92014f64e.jpg) | ![Simulator Screen Shot - iPhone 12 Pro Max - 2021-06-06 at 21 28 38](https://user-images.githubusercontent.com/13472264/120945298-e4fa2380-c70e-11eb-8a0b-e23a836014e0.jpg) 


## Database

You can check `FirebaseDatabase.json` file to have an idea of how the database is set on Firebase.

## Running the project

Make sure you have cocoapods installed, then run the following command withing the project directory:

```bash
  pod install
```

### Credentials

Here are the list of teachers's Ids that you can use. Just type one of them in the login page:

- teacher-0
- teacher-1
- teacher-2

The first one is the one with permission to move a child to another classroom.
The other two just have access to one single classroom.

## Running Tests

To run tests, just press `command + U` within the project. You can also check them into the `TrackMyChildTests` target.

## Project details
This project was built over an MVP-C architecture where the business logic is implemented in the presenter, the navigation logic in the coordinator
and the view logic in view controllers.
We have basically 3 modules in this project:

- Login
- Home
- Children

**Login**: This is the module for login in with the Teacher's ID.

**Home**: In this module we list the classrooms enabled for logged Teacher.

**Children**: This module list all children for a given Classroom. You can also checkin, checkout or move a child.

## Questions

#### Please describe your process for approaching the code challenge. What kind of planning did you do? Did your plans change as you began coding?

Before everything I took a deep look into the database to understand it and see the best approach to use and enhance it.
I've decided to first setup the initial project (Architecture and assets) and also Firebase
database to make sure that both would be working together.

For this project I've decided to use a `MVP-C` architecture since it doesn't requires a big setup and can be mostly done with native APIs from iOS.
It was also a good fit for the project scope.

After this my first goal was to make the classrooms appear, and after it make the children list appear too.
So, after these two were working, I started to implemente the two main functionalities:

*  Check in or check out a child
* Move a child to a different classroom

I've faced some problems with the database at this point because it wasn't
really clear how should I allow or not a teacher to move a child from a classroom.
The reason for that doubt was due the fact that we didn't have a Teacher entity in the database. So I decided to add it to it.

So, because of this change I created a new view for a sort of Login, where you pass the
teacher's ID to login. And now you have teachers that can and others that can't move childs from classrooms.

In sumarry the scope increased a little since my plans changes from the begin to adpat for this teacher's feature.

After this I just implemented all the tests for the presenters.

#### Is there anything you’d like to add or mention in regards to the app design and navigation you chose?

Nothing much to mention here. Just made a "default" flow where you start with the login page,
if you already logged in then you would start from the classrooms page. Then from the classrooms you have
a simple push to the childrens page.

About the design I tried my best, but I can't say that I'm a really good designer 😅

#### If you were given another day to work on this, how would you spend it? What if you were given a month?

• One day:
With another day I would probably work in make the app work offline as well.

• A month:
With a month I think several adjustments and enhancement would be possible, like:

- Enhance the entire UI/UX
- Optimize Firebase database to be more scalable
- Push notifications to let parents know about the checkin
- Introduce animations for some actions
- Offline support

## Licenses

[![MIT License](https://img.shields.io/apm/l/atomic-design-ui.svg?)](https://github.com/tterb/atomic-design-ui/blob/master/LICENSEs)
[![AGPL License](https://img.shields.io/badge/license-AGPL-blue.svg)](http://www.gnu.org/licenses/agpl-3.0)
