# Track My Child

This is a project for a interview test that is basically a virtual check in.
Here a teachers can manage all the childs in their classroom, checking them ir or out
and even changing them from classroom.

## Demo

## Database

You can check `FirebaseDatabase.json` file to have an idea of how the database is set on Firebase.

## Running the project

make sure you have cocoapods installed, then the following command withing the project directory:

```bash
  pod install
```

#### Credentials

Here are the list of teachers's Ids that you can use. Just type one of them in the login page:

- teacher-0
- teacher-1
- teacher-2

The first one is the one with permission to move a child to another classroom.
The other two just have access to one single classroom.

## Running Tests

To run tests, just press `command + U`. You can also check them into the `TrackMyChildTests` target

## Questions

#### Please describe your process for approaching the code challenge. What kind of planning did you do? Did your plans change as you began coding?

Before everything I took a deep look into the database to understand it and see the best approach to use and enhance it.
I've decided to first setup the initial project (Architecture and assets) and also firebase
database to make sure that both would be working together.

For this project I've decided to use a `MVP-C` architecture since it doesn't deppend too much in reaactive tools like MVVM,
and also was a good fit for the project scope.

After this my first goal was to make the classrooms appear, and after it make the children list appear too.
So, after these two were working, I started to implemente the two main functionalities:

• Check in or check out a child

• Move a child to a different classroom

I've faced some problems with the database at this point because it wasn't
really clear how should I allow or not a teacher to move a child from a classroom,
because we didn't have a Teacher entity in the database. So I decided to add it to it.

So, because of this change I created a new view for a sort of Login, where you pass the
teacher's ID and this way login. And now you have teachers that can and others that can't move childs from classrooms

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
