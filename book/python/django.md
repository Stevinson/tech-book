# Django

## Initial Setup

* `django-admin startproject <mysite>` : Creates a mysite directory with a manage.py file 

The main components of django are:

1. Models
2. Urls
3. Views
4. Admin

## Running Development Server

* `python manage.py runserver 8080`


## Apps

* `python manage.py startapp <appname>` : Create an app - a web application that does something, as opposed to a project that is a collection of configuration and apps.

## MVP model

### Views

To create a view you need:

1. Put an endpoint in the `views.py`
2. Add the relevant url in the `urls.py`. These list paths()'s which take a route and a view

* To get from an url to a view Django uses something called *URLconfs*. The setting.py file in the main directory points to the urls.py in the main directory which subsequently points to the urls.py file in each of the separate application directories.

* The logic for an endpoint goes in the model.py 

* Angled brackets <> are used to capture dynamic information in urls

* One separates the page design from the implementation of the view by using a template. To achieve this you create a directory called templates in the application directory. The settigsn for these are contained in the TEMPLATES section in settings.py. By default this looks for a directory called templates in each of the app directories. From within the views logic you can access the template by using `django.template.loader` and `loader.get_template(<relative path from template directory>)`.

* To call python code in django templates use the `{\{ }\}` syntax to access variables from the view and the `{\% \%}` with inner percentage sign syntax to call functions.

* urls can be directly accessed in templates with the followiong syntax: `{\% url 'app_name:url_name  \%}`

* **Generic views** abstract common patterns to the point where one often doesn't need to write python code to develop an app. These include `ListView` and `DetailView`.

### Models and Database

The model is essentially the database layout with additional metadata, and is the single source of truth about the database. The classes in the model files relates to the tables in the database.

Off the back of the model file Django not only creates the database schema but also creates a Python database-access API for accessing Question and Choice objects. 

* If not using SQLite then settings such as USER, PASSWORD and HOST must be added.

* There are a bunch of applications that are installed as default and they make use of the database tables so `python manage.py migrate` needs to be run before running the server. This looks in the `INSTALLED_APPS` that are defined in `settings.py` and creates any necessary tables. 

* `python manage.py makemigrations polls` creates a migration out of the changes that have been made to the models.

* `python manage.py sqlmigrate <app_name> 0001` returns the SQL that is derived from that migration.

* `python manage.py check` checks for any problems in the the project before making migrations.

* Remember to add `__str__` methods to your models.

## API

* `python manage.py shell` to go into the interative shell. Use this instead of just going to the normal python shell as it also sets the `DJANGO_SETTINGS_MODULE` environment variable which gives Django the python import path to the mysite/settings.py file.

* `Table.objects.all()` returns all the elements in that table.
* `Table.objects.get()` can be used to return specific element(s).

* To create a new element create a new object, obj, and then call `obj.save()`. One can then access its fields directly.


## Admin

* `python manage.py createsuperuser` : creates a user that can log in to the admin site. You then need to enter a username, email and password.

* The admin page can be accessed via /admin/

* One also needs to tell the admin that the certain objects have an admin interface. One does this by editing the admin.py file.


## Tests

* The conventional place for an application's test is in the application's `tests.py` file (though the testing system will find any tests in any file that begins with test)

* Create a subclass of `TestCase` with functions that begin with test.

* `python manage.py test <application>` : runs the tests in the specified app.

* Django provides a test client to simulate interacting with the code at the view level.

## Style

* Django looks for static files in a directory called `static` inside the application directory.

## Command Line 

* `python manage.py `

## Specifics

### Signals

Django has a *signal dispatcher* which allows decoupled applications to get notified when actions occur elsewhere in the framework. *Senders* are allowed to notify *receivers* that some action has taken place, i.e. when different parts of the code base are interested in the same events.

Documentation can be found [here](https://docs.djangoproject.com/en/3.0/topics/signals/)

### Forms

Django uses forms to allow input from users. 

To simplify the complex process of handling forms (different data types/ HTML rendering/ validation/ cleaning) Django has a `Form` class that defines a form and determines how it works and appears.

The documentation can be found [here](https://docs.djangoproject.com/en/3.0/topics/forms/).

### Admin

Django has an automatic admin interface which reads metadata from your models to provide an interface where specified users can manage content on the site.

### URLs

Urls are specified in the `urls.py` file in an application.

These use the keyword `urlpatterns` to specify the urls.

Urls use the `path` class:

```
path(<route>, <view>, <kwargs>, <name>>)
```

`include()`: takes a fill python import path that should be included in this place.

### Managers

A Manager is the interface through which database query operations are provided to Django models. At least one Manager exists for every model in a Django application.

By default, Django adds a Manager with the name objects to every Django model class.


### WSGI and ASGI

*Web server gateway interface* is a specification nthat describes how a web server communicates with web applications and how web applications can be chained together to proceess one request.

*Asynchronous server gateway interface* provides a standard interface between async-capable python web servers.


---

## RESTful API

### Requests and Responses

`rest-framework` introduces the `Request` and `Response` classes, which are extensions of the `HTTPRequest` and `HTTPresponse` classes. 

`@api_view` decorator and the `APIView` class for working with class based views provide extra functionality such as requiring a `Request` and adding context to the  `Response`.

`format_suffix_patterns` allows for the use of different format types.

`permission_classes` variable in a view class will set the permissions classes for that view.

When a view is returning JSON you have a `serializer_class` variable in the view, whilst if you are rendering HTML you have a `renderer_class` variable set.:wqcurl -v -s

---

## ViewSet

`ViewSet`s leave the construction of URLs to Django.

A `ModelViewSet` will automatically create the list, create, destroy, get and update commands.

Notice that we've also used the @action decorator to create a custom action, named highlight. This decorator can be used to add any custom endpoints that don't fit into the standard create/update/delete style. The URLs for custom actions by default depend on the method name itself. If you want to change the way url should be constructed, you can include url_path as a decorator keyword argument.

---

## Serialisers

### Serialiser Relations

---

## Logging

### Handlers

The engine that determines what happens to each message in a logger. 

### Filters

Provides control over which log records are passed from logger to handler.

### Formatters

Determiens the form of the text that is rendered.
