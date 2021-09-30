# Github App

## Research 1

I have done some research and gone and created and deployed a Github App, which is the mechanism Github uses to provide narrow, specific permissions (e.g. only write on a specific repo) and send requests to the Github API (amongst other things, such as receive web hooks to be able to respond to events). It’s pretty good as it means the user can give permissions on an organisation level. It also keeps track of credentials, configures webhooks, etc. It’s basically a special set of APIs that makes it easy to set up once and use on a lot of different repos, and to manage the permissions involved in doing this.

All a user does is ‘install’ the app. What this is actually does is creates a virtual user account and gives this account the permissions specified by the app. It is way that all Github integrations work (e.g. Jira, Haystack).

Each installation of the app is identified with a string called the installation ID. The app can turn this into an authorisation token which can be used to hit the Github API for that user. Specifically it is the /app/installations/{installation_id}/access_tokens endpoint that does this. The ‘master’ app account can access all the virtual accounts.

The Upside Github App is in the MyUpside space. It is deployed on Heroku under my personal name space and the test code for the server is in python and in my personal account. I have currently given it permissions to only the upside_analytics repo. It is currently only visible to the MyUpside Github account. I used a python package that handled token renewal, caching, etc but I’m sure there are JS libraries are more mature.

The setup was a little long-winded but the app itself will be reused going forward but the server side code will need to be added to upside-sync.

Useful links:

* Readme contains a good explanation of Github Apps and a (python) implementation: https://github.com/python-trio/snekomatic

* Github Apps docs: https://docs.github.com/en/developers/apps/about-apps

* Github API guide docs: https://docs.github.com/en/developers/apps/guides

* Github API: https://docs.github.com/en/rest/reference/apps#create-an-installation-access-token-for-an-app

## Research 2

A list of the API endpoints available to a Github App can be found [here](https://docs.github.com/en/rest/overview/endpoints-available-for-github-apps)

Notably:

* `/installation/repositories` - list repos that the installation has access to

To get the list of all the webhooks that have been triggered: https://github.com/organizations/MyUpside/settings/apps/upside-github-conn/advanced


Article on how a company implemented a system that manages a Github App so that allows the reuse of an App installation on many users: https://medium.com/altostra/using-a-single-github-app-when-working-with-multiple-accounts-b061ca634525

Identifying and authorising users: https://docs.github.com/en/developers/apps/identifying-and-authorizing-users-for-github-apps