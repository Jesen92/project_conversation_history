# Project conversation history

Using **Ruby 3.2.1** with **Rails 7.0.4.3**

<br>

# Description

App for creating projects and tracking project conversation history along with the project status changes.

Project creation uses `rich_text` body. Project can be deleted as long as it doesn't have any activity.

Comments also use `rich_text` body. Users can create and delete their own comments. 
Changing the status will automatically update the projects status and store the activity.

<br>

# Tehnical notes

To run all of the tests simply run `rspec` from the project root folder.
Running tests will generate the coverage report with `simplecov`. (100% coverage)

For linting run `rubocop`.

<br>

### Single table inheritance
---
Used `projects_activity` for STI where `Projects::Status` and `Projects::Comment` inherited `Projects::Activity` and they share a single database table. Table contains a type column that defines which subclass an object belongs to.

<br>

### Service pattern
---
For *create, update, delete* actions `service` pattern was used, e.g. `Projects::Create::EntryPoint`.
Stored in `units` folder, each unit is used for a single action and it's dependencies.
It's a great way for adding additional logic to all of the actions without making *controllers* "ugly".
The service is always called through its `::EntryPoint`, so when writing tests it is enough to just test all of the cases
from the `EntryPoint` file, e.g. `entry_point.spec`.
It can also be used for any logic that could be expanded upon, hence giving an easy and maintainable way of writing code.

<br>

### Facade pattern
---
Additionally for easier (and cleaner) access to units I've added a simple implementation for a front-facing interface.
So instead of calling `Projects::Comments::Destroy::EntryPoint` we can just opt to call `Projects::Facade.comment_destroy`.
In a real life scenario this could also be used for chaining multiple unites with a single call.

<br><br>

# Screenshot
<img src="public/Screenshot%202023-05-04%20at%2010.46.37.png" width="750" height="auto">
