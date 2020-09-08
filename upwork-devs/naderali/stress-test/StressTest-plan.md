### What is Load Testing?

Load Testing is a type of Performance Testing that determines the performance of the system under real life conditions. It examines how the system behaves during normal and high loads and determines if a system, piece of software, or computing device can handle high loads given a high demand of end users.

 

### Load Testing is used to identify the following :

●   The maximum operating capacity of an application

●   Determine whether the current infrastructure is sufficient to run the application

●   Sustainability of application with respect to peak user load

●   Number of concurrent users that an application can support, and scalability to allow more users to access it.

### What is JMeter?

Apache JMeter is a testing tool used for analyzing and measuring the performance of different software services and products. It is a pure Java open source software used for testing Web Application or FTP application, which allows: 

 

❖   **Recording** – JMeter allows users to record HTTP/HTTPS to create a Test plan using Recording facility. We use Proxy Server that allows JMeter to watch and record your actions while you browse your web application with your normal browser.

❖   **Reporting** – JMeter supports dashboard report generation. A host of reports are generated through JMeter which helps the user to understand Performance test execution results.

 

#### Elements of JMeter

The different components of JMeter are called Elements. Each Element is designed for a specific purpose. Some of the main elements are :

●   **Thread Group** – Thread Groups is a collection of Threads. Each thread represents one user using the application under test. It simulates one real user request to the server. The controls for a thread group also allow you to set the number of threads for each group.

●   **Samplers** – JMeter supports testing HTTP, FTP, JDBC and many more protocols.Thread Groups simulate user requests to the server. Samplers help the Thread Group to know which type of requests it needs to make.

●   **Listeners** – Listeners show the results of the test execution. They can show results in a different format such as a tree, table, graph or log file.

●   **Configuration** – Configuration Elements are used to set up defaults and variables for later use by samplers.

 

 

●   **Assertion** – in JMeter is used to validate the response of the request, that you have sent to the server. Assertion is a process where you verify the expected result with the actual result of the request at run time. If you need to apply assertion on a particular Sampler, then add it as a child of that Sampler.

![Assertion](https://github.com/naderaly/k8-reverse-proxy/blob/master/upwork-devs/naderali/stress-test/attachments/Assertion.png)