# README

Deployed app: https://salty-beyond-73472.herokuapp.com/

Contributors:
- Taya Lacey: https://github.com/tayaaaa
- Paul Meier: https://github.com/fiterr-paul
- Thomas Smith: https://github.com/tomsmi321


## Mood board for Chatr
![moodboard](./app/assets/images/moodboard.png "Moodboard")

## 1. What is the need (i.e. challenge) that you will be addressing in your project?

Our application provides a platform which enables native language speakers to monetize their skills by creating lessons and offering them to students who come to the platform to learn a new language skill. Our marketplace attempts to reduce the frictions involved in this process and facilitate a smooth exchange of value between particpants. 

## 2. Identify the problem you're trying to solve by building this particular marketplace App? Why is it a problem that needs solving?

Finding a face-to-face tutor or conversation partner presents many hurdles to the average language learner, including:
- You may struggle to find somebody in your local area who knows your target language.

- Distance can be a problem, and finding a location to meet is an extra hurdle.

- Face-to-face tutoring can be very formal, it is essential to develop conversational skills outside of a traditional classroom environment.

- The partner you find might not be a native speaker and you may miss out on learning the subtleties of the language that only come with chatting to a native speaker.

- Scheduling can be a challenge - especially for people who are learning a language while working full time, or have children, and need to book time slots with a tutor at short notice or outside business hours.

- Transparency in terms of the quality of service provided by a teacher. This can be addressed with reviews and a rating system.

- Transparency in terms of offerings and pricing

- Existing language exchange websites are unreliable, informal, and focus on ‘exchanging’, both teaching one another your native language, which can lead to an imbalance when the pair have varying proficiency levels. It is also usually left up to the exchange partners to schedule time to chat. This can create issues in terms of communication, especially if you are a beginner. It is essential that language learners are able to organise and schedule lessons in their native language so that it is easy and more likely that you will successfully connect with your partner.

## 3. Describe the project will you be conducting and how. your App will address the needs.

Chatr connects language learners with native speakers and teachers. Unlike traditional language exchange platforms, Chatr makes scheduling and organising with a native speaker easy as it can occur in the language you are most comfortable with. This is approachable for beginners and streamlines the process of trying to find a suitable time and partner.

Students will be able to browse the site for lessons and teachers that interest them. They can use a search function to find lessons for a particuklar language or search for a particular teacher. They can view teacher profiles and check an offering including reviews and ratings for that teacher. 

Teachers will be able to customize their profile as required and create new lessons and set what price they wish to sell their services for. 

Users of the appp can also message each other in order to communicate about upcomming lessons or sort out any questiosn problems they may have

## 4. Describe the network infrastructure the App may be based on. 

Chatr utilises Heroku for deployment to the network. Heroku is a cloud based platform that allows you to run your app in a virtual container called a dyno which executes on a reliable runtime environment. If we wished to scale the app we could set up more dynos on Heroku to handle the increase in resource demand. Heroku applications are assigned a unique domain name which ensures that HTTP requests from a client route to the correct dyno. It also applies the app’s config vars and other environment specifications such as credentials to the runtime environment.

## 5. Identify and describe the software to be used in your App.

#### Front-end:
- CSS: CSS was the main language used to style our app.
- Sass: Sass expanded the capabilities of CSS by allowing us to use variables and nest elements together which made our code a lot cleaner and easier to understand, edit and navigate.
- HTML: HTML was used to construct the overall structure of our web pages.

#### Back-end:
- We used Ruby on Rails to develop the marketplace locally first. Rails is perfect for developing marketplaces because there are so many existing solutions to problems related to marketplaces, which increased our productivity and speed in developing the app. Rails is built on Ruby, which is object oriented and flexible which was perfect for us to write our logic.
- Task Management:
Trello was used to plan out all the tasks needed to complete the app and assign them to team members, who could then mark them off, where green indicates the task was done, orange indicates the task was finished but needed review from another team member, and red indicated that there were problems or difficulties with finishing the task.
- Database:
Chatr has a postgresql database. This database is open source, supports a huge amount of data types and is relational, making it very easy for us to access data between tables. ActiveRecord allowed us to write SQL code, make queries, and create our database using Ruby,making it seamless for us to use postgresql in our rails application.
- Version control:
Collaborating on git and github enabled us to work together on the same rails project remotely, and store a few different copies of our app.

#### Deployment
Our app is deployed using Heroku, which allows us to push our code from github to the internet using their servers and network infrastructure, which is perfect for a small-scale project like this one.


## 6. Identify the database to be used in your App and provide a justification for your choice.

Chatr utilises a postgresql database. This is a well documented open source SQL based system that supports a very large number of concurrent connections. It is widely reported that Postgresql is one of the most robust databases, with outstanding reliability even compared to many expensive proprietary options. We also wanted a relational database to ensure data could be easily and efficiently accessed and manipulated. Additionally, Postgresql works very well with Rails and Heroku.

## 7. Identify and describe the production database setup (i.e. postgres instance).

Chatr’s production database is an instance of a postgres database, hosted on the Heroku cloud platform.
In order for our app to access the postgres database it connects over a network or locally to a running postgres instance. The postgres instance then starts a separate server process to handle the connection.
We initially setup postgres when we first created our rails app and specified it in the rails new command. This database is what was used for development and testing purposes while building our application and seeding it with dummy data. For the production environment we linked up our Github remote with Heroku and Heroku built the database from the migration files.


## 8. Describe the architecture of your App.

![App Architechture](./app/assets/images/app-architecture.jpg "App Architechture")

To illustrate how information flows through the app, I will use the example of a user editing their bio on their profile.

#### Browser
The user can send and receive HTTP requests by interacting with the app through its interface on their browser. There are 4 HTTP requests that are usually made which include:

* GET (to receive information from the database)
* DELETE (delete information from the database)
* POST (send new information to the database)
* UPDATE or PATCH (change or edit information already in the database.)

In our example, the user would press ‘submit’ a form with the details of what they wanted to edit on their profile. This would send an put or patch request.

#### Router

The routes direct the user’s HTTP requests to the correct controllers, and then the correct actions within that controller. In our example, when the user submits the form, it would be wrapped as 'put' request with the details for the update contained in the message body. When this request hits the router it will map to the 'update' action within the 'profiles' controller.

#### Action Controller

The action controller is responsible for defining and organising all of the different actions that can be executed on a table in the database. This contains the logic of the application. 

At stage 2 on the diagram, the action controller is responsible for executing the logic contained in the method. The methods usually do this by requesting information from the database via the model or grabbing information from outside of the app (such as through an API). In our example, the new bio of the user would be passed into the ‘update’ action within the ‘profile’ controller. The update action then requests that the ‘bio’ field in the ‘profile’ table on the database be altered to the new bio.

At stage 7, once the action has been completed, the action controller will reference the right view file that should be rendered in the user’s browser.

#### Active Record

Active record translates ruby into SQL queries, allowing us to request information easily from the database. It will take the information from the action controller and translate it into an SQL query which will ask the database to find the correct user’s profile, and then their bio column, and alter this to the new bio content.
#### Database

We used a postgresql database - its purpose is to store all the information gathered by the application including users information, history of bookings and lessons available. The database will read and execute the SQL query passed to it from active record. This will then be passed back to active record, and then to the action controller which will then execute step 7 to render a view.

#### Views

Views are what the user sees rendered in their browser as a result of the part of the app that they interacted with. In our example, after they have pressed the ‘edit’ button they would be re-directed back to the last page they visited and a ‘success!’ message displayed.

#### User journey through the app

![user flow](./app/assets/images/Student-user-flow.png "student user flow diagram")

![user flow](./app/assets/images/Teacher-user-flow.png "teacher user flow diagram")


## 9. Explain the different high-level components (abstractions) in your App.

Our app follows the Model View Controller (MVC) format and users Active record which is an additional layer sitting between our model and the database. Following the MVC pattern enables separation of concerns by organizing the core functions of our application into discrete sections.

![mvc diagram](./app/assets/images/mvc-model.jpeg "mvc diagram")


- The **Model** represents the underlying logical structure of data within the program. It is the thing that is used to access and manipulate data within the database. It includes logic (functions), attributes of entities, relationships between entities and dependencies/validations.
- The **View**  is a collection of classes representing the elements in the user interface (all of the things the user can see and respond to on the screen, such as buttons, display boxes, and so forth). 
- The **Controller** represents the classes connecting the model and the view, and is used to communicate between classes in the model and view. For example, it might use the model to get some data it wants, do something to it, then serve it to the user in the view. The controller is like mission control, it is the brains of the app.
- **Active record** acts as a go between the model and the database. It saves us from having to write sql and allows us to treat the data in the model as ruby objects

## 10. Detail any third party services that your App will use.

#### Content Delivery Network:
We used Amazon’s S3 service to host and deliver the images on our site. S3 is high speed, web-based cloud storage service, and is ideal for storing images because it can store large file sizes. On the other hand, our database is best at handling a large number of small records that are likely to need to be searched. The profile picture image files on our site are more likely to be large items that do not need to be indexed or searched.

#### Payments:
We used stripe to process payments. Stripe allows card payments.

#### Security:
- We used devise for authentication and to store sensitive user details such as their emails and passwords securely. This also managed their sign-in and everything regarding the creation/editing/or deleting of their account including password recovery.

- Pundit was used for authorization - to restrict the things that users could see and do based on their role as defined within the app.

## 11. Describe (in general terms) the data structure of marketplace apps that are similar to your own (e.g. eBay, Airbnb).

#### VerbalPlanet: 
https://www.verbalplanet.com

Verbal planet has a search feature, like us, but it is more nuanced and allows you to filter and sort tutors based on their average price per lesson. Like us, they have no in-platform video communication, instead relying on skype. They do have an in-platform messaging feature, like us.
Verbal planet also stores your progress and presents a visual interface to view your learning analytics that is visible to both tutors and students. Storing your history and performance allows them to do things like grant percentage discounts on lessons depending on how many you have bought in the past.

They have a more complex data structure to record your proficiency in a language that splits it up into your Speaking, Listening, Reading and writing skills with a more nuanced scale from beginner to advanced.
They have separate roles for teachers and students, but users can also have a secondary role - for example they have a ‘business mode’ to help you learn business related language and industry specific jargon from professional teachers who indicate themselves as working in a particular field. This is stored in their database.

There is an application process to become a teacher, and administrators will allow tutors based on demand and quality, instead of allowing tutors to sign up and create an account instantly. Tutors can post short videos of themselves speaking which VerbalPlanet stores.

#### DuoLingo:
https://www.duolingo.com/

Duolingo provides gamified language learning courses rather than facilitating language exchange between two users. There are pre-determined lessons which you are meant to interact with daily, and lessons are recorded and narrated by native speakers. Users do not interact directly with natives, and they are given ratings based on their performance in the course content. There is no model for payment for individual lessons, instead you can purchase a monthly subscription to ‘DuoLingo Plus’ which allows you to access the content without ads.

#### Conversation Exchange
https://www.conversationexchange.com 

Conversation exchange allows you to publicly post your personal profile and see the profiles of other learners. It is up to you to find a conversation partner and determine how you will chat. There is no structure for storing, sending or receiving messages - an email communication system is used. There is no model for making or receiving payments. Revenue is derived through donations to the site. There are therefore no roles for teachers or students. There is no option to review or rate another person, so no data structure to store this information. They have a ‘resources’ section on their site, where they externally reference youtube videos with tips/tutorials/common phrases. Though they have some posts on their site, these are just new views with content about what questions to ask somebody. Users do not have the ability to make posts, only the site administrators. They do not store relationships or interactions between users.

#### Italki
https://www.italki.com/ is a very similar application to Chatr and provides some advanced functionality for its users. You can sign up as a general user then upgrade to a teacher or you can decide to sign up as a teacher from the outset. It is an app deployed at scale. They would therefore be using a database that can support many concurrent connections. This database would be either self hosted across a number of servers to handle large loads/server downtime or in a cloud environment through AWS for example. They would likley have a significant database model to handle all the different relationships between entities and enure that the data model is normalised to reduce data redundancy and dependancy.

## 12. Discuss the database relations to be implemented.

In the first few days of our project after requirements gathering and user stories we began structuring our ERD to map out the data model for our application and the relationships between entities. We have twelve tables plus those generated by active storage for images. Relationships are defined within the model for each entity as has_one, has_many, belongs_to etc. For example a user has many lessons, a lesson has many bookings, a booking has one review, a review has one reply. A reply belongs to a review, a review belongs to a booking, a booking belongs to a lesson and a user, a lesson belongs to a user. See question 13 for full list of active record table associations.

## 13. Describe your project’s models in terms of the relationships (active record associations) they have with each other. 

The relationships between our models are included below.

class User
  has_many :conversations
	belongs_to :role, optional: true
	has_many :notifications
  has_one :profile
  has_many :userbookings
  has_many :messages
  has_many :lessons

Conversation
    belongs_to :user1, :class_name => "User"
	belongs_to :user2, :class_name => "User"
	has_many :messages, dependent: :destroy

Languageskill
    belongs_to :profile, optional: true
    has_many :lessons

Lesson
  belongs_to :languageskill
  has_many :userbookings
  belongs_to :user

Message
    belongs_to :conversation
    belongs_to :author, :class_name => "User"

Profile
  belongs_to :user, optional: true
  has_one_attached :uploaded_image
  has_one_attached :background_image
  has_many :languageskills, dependent: :destroy

Reply
  belongs_to :review

Review
  belongs_to :userbooking
  has_one :reply, dependent: :destroy

Role
  has_many :users

Userbooking
  belongs_to :user
  belongs_to :lesson
  has_one :review, dependent: :destroy

## 14. Provide your database schema design.

![user schema](./app/assets/images/Tom-ERD.png "Schema")

## 15. Provide User stories for your App.

![user stories](./app/assets/images/user-stories.jpg "User Stories")

## 16. Provide Wireframes for your App.

![wireframe1](./app/assets/images/wireframe1.png "wireframe1")

![wireframe2](./app/assets/images/wireframe2.png "wireframe2")

![wireframe3](./app/assets/images/wireframe3.png "wireframe3")

![wireframe4](./app/assets/images/wireframe4.png "wireframe4")

![wireframe5](./app/assets/images/wireframe5.png "wireframe5")

## 17. Describe the way tasks are allocated and tracked in your project.

We used Trello and Slack as our two main tools for tracking tasks and communication. Once we had our vision we worked out an MVP with user stories and wireframes. We then abstracted this into discrete tasks that were allocated to categories in Trello and assigned to team members. Our Trello had categories for Ideation, Design, Build, Testing, Deploy, Strech goals, Documentation and Bug fixes. Each card was updated with a color status to indicate whether it was completed or had issues, with any issues being described in greater detail in the notes and comments section of each card. 

Given the limited time for the project we built out a timeline and worked out which tasks needed to be prioritized to achieve our MVP. Team members worked on different tasks so as to avoid overlap and conflicts. We also used Slack to coordinate pull requests, code reviews and to discuss what our hurdles were to make sure we made consistent progress.

![trello](./app/assets/images/Trello.png "trello")

![trello-2](./app/assets/images/Trello-2.png "trello-2")

## 18. Discuss how Agile methodology is being implemented in your project.
#### Frequent inspection:
We used git for version control, submitting pull requests kept everybody accountable and ensured that code was always double checked.


#### Adaptation:
We pivoted and adapted to changes in our ERD structure a few times over the course of the assignment. This happened when we realised we had made small mistakes, or thought of better ways to structure our data, and so had to re-do our models. We looked at these realisations as positive improvements, and instead of ignoring them, we adapted to this.


#### Accountability + Teamwork:
Using a Kanban board on trello was very effective at keeping us accountable - once tasks were assigned, our name was added to them and we had the responsibility of marking them off as complete once they were done. As a team, we spent some time at the start and end of each day to set goals and debrief about what we wanted to get done that day. We truly worked together, asking each other for opinions when we got stuck. There was a very encouraging dynamic within the team.


#### Iterative development:
This was implemented from day one, when we defined clearly what our MVP would look like for Chatr. However, no ideas were totally shot down - we added them all to our ‘stretch goals’ list on our trello board. This allowed us to clearly prioritise tasks in order to ensure that we were focusing on building the most important core features of the app.

## 19. Provide an overview and description of your Source control process.

We used Git and Github as version control and source control tools during our project. This enabled us to collaborate on the project together and ensure that our code did not conflict.
In general, we all created a new branch for each table or new feature that was implemented and made frequent commits with descriptive messages. 

## 20. Provide an overview and description of your Testing process.

Manual testing was used for our application. In the future, if we extend the app will will create unit tests for code modules and automate with Rspec.
Systematic manual testing was done at a number of different times throughout the app development cycle. We started by making sure that our student and teacher user stories matched up with the functionality of our app.
We wrote up all the pages and went through each page logged in as a student and as a teacher and fixed any bugs one by one, making sure to try as many different possibilities as were were able. This was done continually throughout the project.
We used devise for authentication and pundit for authorization. We manually tested all routes to make sure only authenticated/authorized users could access certain resources.

## 21. Discuss and analyse requirements related to information system security.
Information security measures attempt to address one of the following three broad goals:  
- Protect the confidentiality of data
- Preserve the integrity of data
- Promote the availability of data for authorized use

This is represented in the figure below.

![security goals](./app/assets/images/security-goals.jpg "Security Goals")

The aim of **Integrity models** is to ensure data is kept untampered and trustworthy by protecting system data from accidental or intentional changes by unauthorised parties or hackers.

**Availability models** aim to make certain that data and resources are always available for authorized users. For example the model needs to take into consideration unexpected and irregular events such as emergencies, disasters, DDOS attacks and equipment failures. An example of this would be making data redundant across a number of different physical locations and having backup servers.

**Confidentiality** models act to safeguard information from people that are unauthorized to view or access it. The confidentiality principle prescribes that information should only be viewed by users with the correct privileges

## 22. Discuss methods you will use to protect information and data.
Sensitive data used by chatr includes card and payment information, user schedules and contact information, and passwords. 

#### Payment information: 
Stripe forces HTTPS using TLS (transport layer security). This ensures that data transferred between two users is encrypted before being sent. Stripe uses separate infrastructure for their website and API to the infrastructure they use for storing personal information and information relating to decryption. None of their internal servers can get plaintext card numbers.
Passwords: We used Devise to secure our website, so user’s passwords are encrypted.

#### Submitting Forms: 
Rails protects against injection attacks by including a unique authorisation token when a form is submitted.

#### User-to-user security: 
Because there is personal information attached to users’ profiles, you must create an account and be authorised to access the website and see tutors and students profiles and available lessons. We used pundit to implement in-site authentication to prevent users from seeing information that should not be available to them, such as the previous lessons of other users.

## 23. Research what your legal obligations are in relation to handling user data.

Australian privacy laws relate to the obligations of a business with respect to how they manage user’s personal data. Specifically a business must collect and store data in such a way as to guard against : theft, misuse, interference, loss, unauthorised access, modification and disclosure.

The business must also only collect personal information to the extent that it is necessary for the function or activity of the business. With relation to our application, if we deployed in a public environment then it would be good practice to include terms of service on the site along with a disclosure statement outlining to our customers what types of information about them we collect and how it is used. We would need to ensure that we are consistent with the service agreement in terms of the use of the data in our application.

We have taken some steps in meeting our obligation via the use of devise and pundit for authentication and authorisation respectively. These gems help to restrict who can access and modify particular data. For example Devise ensures that user passwords are encrypted. 

If scaled, protecting user data would extend beyond just what happens in the code and would include policies around admins and the kinds of resources they can access and change along with the processes for doing so.

Implementing a log system for tracking timestamps of any changes made to resources would be important for understanding if anything goes wrong and being able to investigate security issues.
Data redundancy and backup is a consideration also. If our server is compromised or destroyed we need to be able to retrieve our customers details still.
