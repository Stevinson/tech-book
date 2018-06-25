# Guice

## Factories

* This decouples the client and implementing class

* Uses static methods to get and set mock implementations for interfaces

"The Factory pattern vogue stems from an almost-dogmatic belief among coders in "C-style" languages (C/C++, C#, Java) that use of the "new" keyword is bad, and should be avoided at all costs (or at least centralized). This, in turn, comes from an ultra-strict interpretation of the Single Responsibility Principle (the "S" of SOLID), and also of the Dependency Inversion Principle (the "D"). Simply stated, the SRP says that ideally a code object should have one "reason to change", and one only; that "reason to change" is the central purpose of that object, its "responsibility" in the codebase, and anything else that requires a change to code should not require opening up that class file. The DIP is even simpler; a code object should never be dependent upon another concrete object, but instead on an abstraction.

Case in point, by using "new" and a public constructor, you are coupling the calling code to a specific construction method of a specific concrete class. Your code now has to know that a class MyFooObject exists, and has a constructor that takes a string and an int. If that constructor ever needs more information, all usages of the constructor have to be updated to pass in that information including the one you're writing now, and therefore they are required to have something valid to pass in, and so they must either have it or be changed to get it (adding more responsibilities to the consuming objects). In addition, if MyFooObject is ever replaced in the codebase by BetterFooObject, all usages of the old class have to change to construct the new object instead of the old one.

So, instead, all consumers of MyFooObject should be directly dependent on "IFooObject", which defines the behavior of implementing classes including MyFooObject. Now, consumers of IFooObjects can't just construct an IFooObject (without having the knowledge that a particular concrete class is an IFooObject, which they don't need), so instead they must be given an instance of an IFooObject-implementing class or method from outside, by another object that has the responsibility of knowing how to create the correct IFooObject for the circumstance, which in our parlance is usually known as a Factory.

Now, here's where theory meets reality; an object can never be closed to all types of change all the time. Case in point, IFooObject is now an additional code object in the codebase, which must change whenever the interface required by consumers or implementations of IFooObjects change. That introduces a new level of complexity involved in changing the way objects interact with each other across this abstraction. In addition, consumers will still have to change, and more deeply, if the interface itself is replaced by a new one.

A good coder knows how to balance **YAGNI ("You Ain't Gonna Need It")** with SOLID, by analyzing the design and finding places that are very likely to have to change in a particular way, and refactoring them to be more tolerant of that type of change, because in that case "you are gonna need it. (StackOverflow)

### Factories in Practice

1. There are **modules** in which we must ...

The `implement(A, B)` method takes two arguments, creating a contract that says that whenever ... . See below.

```Java
install(new FactoryModuleBuilder()
    .implement(IRecordPredicate.class, DeduplicateDataRecords.class)
    .build(IDeduplicatedDataPredicateFactory.class));
```

`FactoryModuleBuilder` has all the relevant methods that combine the caller's arguments with injector supplied values to construct objects.

2. Then we have a **factory** class that has a `build()` method that is called when we want a new object, and automatically does so with the correct scope. We never `new` up objects directly in the code, apart from in these factory classes.



------------------------------------------------------------------------------------------------------------------------------



## Scope

There are three types of scope in Guice, and these should be chosen based on how long state hangs around for:

1. `@ImplementedBy` is the way on implementing something that does not have state, i.e. creating a new instance every time it is asked. It can also be implemented by `@Provides` which provides a binding at the point of call instead of the point of compilation.

1. `@RequestScope` remembers stuff across classes.

1. Container scope are life long bindings, and are used for things like servers which will want the same properties associated for their life.

Scope is defaulted to instance, so this is what everything that is not explicitely labelled otherwise is.


## Scope and Guice:

Scope is used to control the amount of instances created of certain things for a certain scope/thread

    -main reason : for heavy instances where it would be bad for performance to create multiple instances

Scope emulated the SINGLETON PATTERN ie. factory that creates one and only one instance (if instance already exists, uses it, otherwise creates it).

Singleton pattern poses a potential performance bottleneck problem with multithreading so we use scope instead:

CONTAINER SCOPE is an artificial construction for bindings that extends the scope to the bredth of the application server rather than a REQUEST (Guice) scope/thread.

Contains Map<Key<?>, Object> (key is the Interface and Object may be the implemented class).

In web.xml:

    <context-param>
    	<description>Properties for ContainerScopeInitializerModule</description>
    	<param-name>com.i2group.apollo.scheduling.ContainerScopeInitializerModule_Properties</param-name>
    	<param-value>
    		containerScopeName=Disco
    		,containerScopeServices=SessionResource:UserResource:SubsetResource:ChartResource:SearchResource:SearchJobResource:InformationStoreResource:ItemDataResource:JobResource:VisualQueryResource:ExploreResource:TextSearchResource
    	</param-value>
    </context-param>

At startup, every resource in containerScopeServices is inserted into the containerScope under the name Disco and all those bindings can be accessed from the same app.

There also exists THREAD SCOPE that is also artificially construcgted but Guice allows it. Mainly used for db stuff eg. used to take up db connections and when that scope runs out, they are freed.
### Circular loops

To break circular guice loop, move method out into new interface or provide one the classes with @provide annotation.

------------------------------------------------------------------------------------------------------------------------------



## Annotations

### Assisted Prameters

`@assisted` -> need to go to the factory which defines the constructor. Don't use guide rules but rather the parameter passed in on the interface. Comes from factory and not Guice land.

Allows you to write less coupled code.

Guice needs to inject something but some of the parameters are onlu available at runtime. e.g a text search string. Uses a ffav=ctory buildr oRRWEB,


### Nullable

`@nullable`

## Other

Guice binding files tend to be saved in modules called **`.guice.internal`**, which makes it easier to find them when they pressing `cmmd` + `shift` + `G` to search for



------------------------------------------------------------------------------------------------------------------------------



## Lisa's Notes

Guice allows you to perform dependency injection. With dependency injection, objects accept dependencies in their constructors. As this requirement carries over to each object’s dependencies you need an object graph, and Guide allows you to build this graph. The `@Inject` annotation before the constructor signifies that Guice is being used.

* Bindings map types to their implementations; a module is a collection of bindings specified using method calls. Modules are the building blocks of an injector - which is Guice’s object-graph builder.

* Factory methods in Java deal with the problem of creating objects without having to specify the exact class of the object that will be created. “The Factory method lets a class defer instantiation it uses to subclasses”.

* Guide alleviates the need for factories and the use of new (think of `@Inject` as the new new keyword), and makes for easier unit testing.


---

GUICE EXPLICIT BINDING (creation and then installation of a module):

    -for polymorphism
    	-if an Interface has multiple implementations you specify which implementation gets injected
    -to specify scope ie. container scope

    eg. in SolrIndexSchedulerModule extends AbstractModule:
    final ContainerScope containerScope = ContainerScopeFactory.getScope(SERVICE_NAME);  //eg. service_name might be DISCO
        bindScope(ContainerScoped.class, containerScope);  //binds that

        final ConfigurationModule configurationModule = new ConfigurationModule();
        install(configurationModule);
        install(new SolrSearchModule());

        bind(ITracerFactory.class).to(TracerFactory.class);  //explicit Guice binding when you want to specify container scope (even if only one implementation of that interface exists)

        bind(IOneOffJobExecutor.class).to(SolrIndexScheduler.class); //looks like this is due to polymorphism
    }

    -for testability

 GUICE IMPLICIT BINDING (implemented by / implements):

    -best practice, standard Guice use

---

Guice uses BINDINGS to map types to their implementations.

INJECTOR -> Guice's object-graph builder

MODULE - a collection of bindings to map types to their implementations

    	- a collection of bindings specified using Enlglish-like method calls
    	e.g. bind(TransactionLog.class).to(DatabaseTransactionLog.class); <- tells Guice that whenever it sees a dependancy on a TransactionLog, it should satisfy the dependency using a DatabaseTransactionLog (so instead of I implemented by non I) this is bind(I.class).to(nonI.class)
    	- building block of an INJECTOR
    	- this class extends AbstractModule

We create an injector, then we use it to build the class that requires the injections e.g BillingService that requires TransactionLog and CreditCardProcessor

INJECTION POINT - a constructor/field/method that can receive injections (anything that can have an @Inject in it)

    			- each injection point has a collection of dependencies


          Dependancy injection (like  factories) is a desing pattern.

          The dependency injection pattern leads to code that's modular and testable.

          Core principle: to SEPERATE BEHAVIOUR from DEPENDENCY RESOLUTION

          ie. a class is not responsable for looking up its dependencies; instead, they're passed in as constructor parameters

          Without Guice:this would have to be done recursively for every class ie the dependencies of the dependencies would have the desingn pattern applied to it etc.

          with GUICE we can avoid this:

          Guice how to:

          1) Tell Guice how to map the injected interfaces to their implementations (this configuration is done in a Guice module <- any Java class that implements the Module interface)

          —————————————————————————————————————————

          My notes:

          - Guice allows you to perform dependency injection. With dependency injection, objects accept dependencies in their constructors. As this requirement carries over to each object’s dependencies you need an object graph, and Guide allows you to build this graph. The @Inject annotation before the constructor signifies that Guice is being used.
          - Bindings map types to their implementations; a module is a collection of bindings specified using method calls. Modules are the building blocks of an injector - which is Guice’s object-graph builder.

          // TODO read https://github.com/google/guice/wiki/AssistedInject
