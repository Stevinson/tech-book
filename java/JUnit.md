# JUnit

## Setting up a test

There are several annotations that facilitate the initialisation of a test, allowing set up of variables and the environment before any of the tests in the class are run. These are:

* `@Before`

This code is executed before each test.

* `@BeforeClass`

This code is executed once, before the entire test fixture. This is done with computationally expensive methods or when they share resources. A good example is the establishing a database connection that all the tests use.

Code marked `@BeforeClass` is run as **static initialiser**, and so it will run before the class instance of the test fixture is created. Note that the static keyword therefore has to be added before the @BeforeClass method.

* `@BeforeEach` and `@BeforeAll` are the equivalents of `@Before` and `@BeforeClass` in JUnit4.

* Similarly there is a `@After` and an `@AfterClass` (throws exception) which are used to execute code after the tests have finished.

## Different assertions

* `verifyNoMoreInteractions()`


---



## Checking for an exception

Use the `@Rule` annotation to initialise an `ExpectedException`.

```Java
@Rule
public ExpectedException mExceptionGrabber = ExpectedException.none();
```

Then state when in the test an exception is expected and then after that fail the test, so that it fails if the test does not fail when stated.

```Java
mExceptionGrabber.expect(NullPointerException.class);
mChartDAO.getChartRecordFromId(RECORD_ID_1);

// Shouldn't get here
fail();
```
