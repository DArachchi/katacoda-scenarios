The sample project shows the components of a basic Vert.x project laid out in different
subdirectories according to Maven best practices.

**1. Examine the Quote Generator project structure.**

Switch to the ``quote-generator`` project

``cd quote-generator``{{execute}}

Let’s have a look at the project, as every other project are structured the same way.

``tree``{{execute}}

```text
.
|-- README.md  <----- A readme containing the description and (build) instructions
|-- pom.xml  <----- The project build file
|-- src
|   |-- kubernetes/config.json <---- The configuration of the application
|   |-- main
|   |   |-- fabric8
|   |   |   `-- deployment.yml  <----- The Kubernetes deployment customization
|   |   |-- java
|   |   |   `-- io/vertx/workshop/quote  <----- The source file you need to complete
|   |   |                   |-- GeneratorConfigVerticle.java
|   |   |                   |-- MarketDataVerticle.java
|   |   |                   `-- RestQuoteAPIVerticle.java
|   |   `-- solution
|   |       `-- io/vertx/workshop/quote  <----- The complete code (including the answers to the assignments)
|   |                          |-- GeneratorConfigVerticle.java
|   |                          |-- MarketDataVerticle.java
|   |                          `-- RestQuoteAPIVerticle.java
|   `-- test
|       |-- java
|       |   `-- io/vertx/workshop/quote  <----- The test cases
|       |                         |-- GeneratorConfigVerticleTest.java
|       |                         `-- MarketDataVerticleTest.java
|       `-- resources  <----- resources used for tests
`-- target  <----- output directory
```

>**NOTE:** To generate a similar project skeleton you can visit the [Vert.x Starter](http://start.vertx.io/) webpage.

Let’s start with the pom.xml file. This file specifies the Maven build:

1. Define the dependencies
2. Compile the java code and process resources (if any)
3. Build a fat-jar

A fat-jar (also called uber jar or shaded jar) is a convenient way to package a Vert.x application. It creates an uber-jar containing your application and all its dependencies, including Vert.x. Then, to launch it, you just need to use java -jar <jar name> without having to handle the CLASSPATH. Wait, I told you that Vert.x does not dictate a type of packaging. It’s true, fat jars are convenient, but they are not the only way. You can use plain (not fat) jars, OSGi bundles…​
The pom.xml file also contains a set of properties used to configure the application:

* vertx.verticle defines the main verticle - the entry point
* vertx.cluster.name defines the name of the cluster

**Verticle**

As you may have noticed, the code is structured in 3 verticles, but what are these? Verticles is a way to structure Vert.x application code. It’s not mandatory, but it is quite convenient. A verticle is a chunk of code that is deployed on top of a Vert.x instance. A verticle has access to the instance of vertx on which it’s deployed, and can deploy other verticles.