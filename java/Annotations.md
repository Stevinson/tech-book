# Annotations

## General

Annotations are used for compiler instructions, build-time instructions and runtime instructions. Annotations are used at build time. The build process is typically done by an automatic build tool, and annotations allow a means to provide specialised instructions. Normally annotations are not present in the Java code after compilation.

## Built in Annotations

* The three built in Java annotations are: `@Deprecated`, `@Override` and `@SuppressWarning`.

The Deprecated annotation marks a class, method or field as deprecated, implying that it should no longer be used. As a result the compiler will give a warning whenever something that has been marked as deprecated is used.

* `@Retention(value=RUNTIME)`

Indicates how long annotations with the annotated type are to be retained. If no retention annotation is present on an annotation type declaration the retention policy defaults to `RetentionPolicy.CLASS`.

* `@Target(value=ANNOTATION_TYPE)`

Indicates the kinds of program element to which an annotation type is applicable. Defaults to any program element.

## Custom Annotations

Custom annotations are created with the keyword`@interface`. These are defined in their own file, just like a class or an interface.

Many APIs require a lot of boilerplate code, for example JAX-RPC services require paired interfaces and implementation and JavaBeans require a BeanInfo class to be maintained in parallel.

Once an annotation is defined, it can be used to annotate declarations. An annotation is a special kind of modifier, that can be used anywhere that other modifiers (such as public, static or final) can be used, and by convention precede all of them.



## Syntax

* `@Entity(tableName = "vehicles")`

This is how you provide values into an annotation.

Return types are limited to String, Class and enums.

## API

### Entity

```Java
@Entity
```

Entities are lightweight persistence domain objects. They typically represent a table in a relational database, and each entity instance corresponds to a row in that table.

### Basic

```Java
@Basic
```

Basic signifies that an attribute is to be persisted.
