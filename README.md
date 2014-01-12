#E-Factor

Making an interface to log actual work time, and why that work stopped.

##Setup

###Install Ruby Gems

`bundle install`

###Omniaith

**GitHub**

```
export GITHUB_KEY=YOUR_GITHUB_CLIENT_ID
export GITHUB_SECRET=YOUR_GITHUB_CLIENT_SECRET
```

**BitBucket**

```
export BITBUCKET_KEY=YOUR_BITBUCKET_KEY
export BITBUCKET_SECRET=YOUR_BITBUCKET_SECRET
```

##Running Locally

`rackup -E development config.ru`

##Deploying to Heroku

```
heroku apps:create <your-app-name>
heroku config:set GITHUB_KEY=$GITHUB_KEY
heroku config:set GITHUB_SECRET=$GITHUB_SECRET
heroku config:set BITBUCKET_KEY=BITBUCKET_KEY
heroku config:set BITBUCKET_KEY=$BITBUCKET_KEY
heroku config:set BITBUCKET_SECRET=$BITBUCKET_SECRET
git push heroku master
```
