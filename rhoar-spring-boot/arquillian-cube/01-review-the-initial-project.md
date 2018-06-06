# Review the base structure of the application

For your convenience, this scenario has been created with a base project using the Java programming language and the Apache Maven build tool.

The base project contains code for a simple Spring Boot application that exposes web services to retrieve data. Also, the project contains a simple integration test. Start by reviewing the  project's content by executing a ``tree``{{execute}} in your terminal.

The output should look something like this:

```sh
.
├── pom.xml
└── src
    ├── main
    │   ├── fabric8
    │   │   ├── deployment.yml
    │   │   └── route.yml
    │   ├── java
    │   │   └── com
    │   │       └── example
    │   │           └── Application.java
    │   │           └── service
    │   │           	└── Fruit.java
    │   │           	└── FruitController.java
    │   │           	└── FruitRepository.java
    │   └── resources
    │       └── static
    │           └── index.html
    └── test
        └── java
            └── com
                └── example
                    └── FruitControllerIntTests.java
```


Except for the `fabric8` directory and the `index.html`, this matches what you would get if you generated an empty project using the [Spring Initializr](https://start.spring.io). For the moment you can ignore the content of the fabric8 folder (we will discuss this later).

One thing that differs slightly is the ``pom.xml``{{open}} file.

 
To leverage Arquillian Cube the project uses the Arquillian Cube BOM provided by the Arquillian Project. Using this BOM ensure access to all of the  dependencies needed to use Arquillian Cube.

```xml
  <dependencyManagement>
    <dependencies>
      <dependency>
        <groupId>org.arquillian.cube</groupId>
        <artifactId>arquillian-cube-bom</artifactId>
        <version>${version.arquillian-cube.bom}</version>
        <type>pom</type>
        <scope>import</scope>
      </dependency>
    </dependencies>
  </dependencyManagement>
```

**1. Test the application locally**

As we develop the application we want to be able to test and verify our change at different stages. One way we can do that locally is by using the `spring-boot` maven plugin.

Run the application by executing the following command:

``mvn spring-boot:run``{{execute}}

>**NOTE:** The Katacoda terminal window is like your local terminal. Everything that you run here you should be able to execute on your local computer as long as you have `Java SDK 1.8` and `Maven` installed. In later steps, we will also use the `oc` command line tool for OpenShift commands.

**3. Verify the application**

To begin with click on the **Local Web Browser** tab in the console frame of this browser window which will open another tab or window of your browser pointing to port 8080 on your client. Or use [this](https://[[HOST_SUBDOMAIN]]-8080-[[KATACODA_HOST]].environments.katacoda.com/) link.

You should now see an HTML page with the `Welcome to Spring Boot` welcome message. If you see this then you've successfully set up the application! If not check the logs in the terminal. Spring Boot adds a couple helper layers to catch common errors and print helpful messages to the console so check for those first.

**4. Stop the application**

Before moving on, click in the terminal window and then press **CTRL-C** to stop the running application!

## Congratulations

You have now successfully executed the first step in this scenario. In the next step we will 

TODO
