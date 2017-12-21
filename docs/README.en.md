# ExpertTodo
ExpertTodo is a project to review participants' expert-todo apps in [Step-to-Rails-Expert.rb](https://step-to-rails-expert-rb.connpass.com/), a Japanese RoR community for intermediate engineers.

Fork this repo/another forked repo, implement the features written below and take part in Step-to-Rails-Expert.rb, and then they review your app!


## App Name Rule
If you use Heroku as a platform, use `${account_name}-expert-todo`, or the url will dupulicate.

## Development Flow
### If you start from scratch,
- Fork this repo
- On the master branch, run `rails new` and commit them
- Move on to review branch, work there (or you can move on to another topic branch from the review branch)
- Open a PR from YOUR review branch to YOUR master branch by the day  
participants review the PR from YOUR review branch to YOUR master branch.

### If you start from another forked repo,
- Fork the repo you choose
- Move on to review branch, work there (or you can move on to another topic branch from the review branch)
- Open a PR from YOUR review branch to YOUR master branch by the day  
participants review the PR from YOUR review branch to YOUR master branch.

### By the day, you need
- To open a PR from YOUR review branch to YOUR master branch 
- To upload the app to Heroku or other platforms  
This makes it easy for participants to use the app.

## Rule
- Make the source public on GitHub
- Make sure to fork this/another forked repo
- Upload the app to Heroku or other platforms
- Set up CI
  - Write tests as much as you feel necessity
  - Can use any CI services
- Require UI of at least the level someone doesn't feel confused in using
- Not have to guarantee existing data to be kept (you can drop existing data even in production)

## Specifications
You don't have to satisfy all the specifications, you can pick up features you like to create. But it is the exception if a feature is mentioned as required.
### Minimum features (held on 2017/09/25)
If you don't want to create them, fork a forked repository.
- Email user authentication
- Create/update/delete tasks
- Task has due date and explanation  
Due date and explanation are optional.

### Second additional specifications
Implement the required feature at least by 2017/11/27
#### Required
- Get the task status changed into done  
For example, satisfy the use case: the task, to finish cleaning by tomorrow, is finished today.

#### Optional
- Level 1: send a signup email
- Level 2: a task has attached files
- Level 3: Update the status of multiple tasks (task1 and task 2 into done, for example)

### Third additional specifications
#### Optional
- Level 1: dupulicate a task  
- Level 2: a task has priority
- Level 3: sync to the Google calender