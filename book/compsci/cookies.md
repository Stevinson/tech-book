# Cookies

## What is a cookie?

Cookies are given to a browser by the server. The data in a cookie allows the server to 'continue a conversation', as without the cookie the server considers the browser a first-time visitor.

## Types of cookie

1. **Session computer browser cookies** are stored in the browser but deleted when the browser shuts down. They allow the user to move from page to page within a site without the constant need to sign in.

1. **Permanent computer browser cookies** are saved to the hard drive until they expire. They are used to profile users by their behaviour within the site and help the site manager monitor the performance of the website. These are only read by the company that places the cookies on the computer.

1. **Third party computer browser cookies** allow ads to target a user's location and allow third party's to determine user interest by tracking the web user through browser activity. If a marketing company has rights over several popular websites, then over time they can determine a user's identifying traits such as politics, gender and income.


## How are they created?

When surfing the internet, the Web server receives the IP address, web browser, the date and time, the link used to access the page and OS (without any usage of cookies).

A domain can give a browser up to twenty cookies, each being up to 4k in size.

## What information do they hold?

Information such as number of visits to the site, previous searches and purchases made on the site.

They are a text file and as such there is no executable code in a cookie that is accepted by a computer.

## How are they used?

Cookies can be shared with the domain only by the very same browser they were given to.  Not by other browsers, even browsers on the same computer.

## How to I access them?

You can find the cookies in your system in the *Documents and Settings* directory (Windows), or cookie jar. Different browsers tore cookies n different locations.


---


## Caching

When you send a request to a website such as the BBC your request will go through several proxies. The request header can notify these proxies to not cache as the content may be dynamic or it could do the opposite and say that the content is not going to change for 60 seconds so it can be cached. Sometimes it could contain SSL data

We have a global interceptor that detects if a request is a GET request and if so will always return PRIVATE and NO STORE. To see where this code is located look in `RESTCacheControl`. Note that POST requests cannot be cached as they have a body.


---


## LTPA Tokens


### Log out

When someone is logged out of Liberty, the **Lightweight Third-Party Authentication (LTPA)** token that is used for SSO is removed from the cookie. The token is also removed from the local Authentication cache and the session is invalidated.

### Log in

When opening the page, the browser will ask if you have an sso token (ltpa token). If not then the server will return what authentication type is set. If it is client cert then a 401 and authenticate client cert, or if 302 then redirect to form for basic auth.

If the LTPA token is present then it is validated based on the expiration time and the encryption keys.

The `trackLoggedOutSSOCookies` setting in the `server.xml` turns on tracking of the tokens that were logged out, meaning that if they are used again to log in then the user is made to authenticate.

Note that this tracking only works on one server - this may cause problems when turning multi-server.
