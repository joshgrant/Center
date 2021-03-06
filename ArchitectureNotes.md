Settings have to be stored somewhere - this should be detached from the actual storage. I.E we should be able to switch out NSUserDefaults with CoreData and not see any changes (perhaps different settings). I think a settings protocol makes sense?

---

Data is the underlying pattern - so we need a data object.

Data is created by following the pattern of a model. So we need a model protocol.

ViewModels are a protocol

Concrete view models implement a view model protocol that exposes the view

We have a class for interaction - i.e every action that the user can perform on a view

We have a class for animation - i.e every animation change that the user can perform on a view

We have a class for useCases - i.e they encapsulate business logic

We have a class for observers - i.e view controllers needing to respond to external events

---

1. Start with the data. Where does it come from? A data factory
2. Every factory must have no state, only static methods, 
2. The data can be transformed via functions
3. The data can be transformed into views with a ViewFactory
4. The data can be transformed into animation with an AnimationFactory
5. The data can be transformed into a notification with a NotificationFactory
6. The data can be transformed into a useCase with a UseCaseFactory
- should have progress closures (optional) to report how far the usecase has been completed
- might need to use Combine Futures to keep the use case in memory
- needs a start method
- can also have a stop method (conforms to Cancellable)
- can use Result<Success, Failure> to report the result of the useCase (use a typealias perhaps)
- can use combine to chain commands in order

Each factory contains the necessary dependencies to instantiate the various resulting objects
Each object is another piece of "data" in that it has no functionality

Each factory only contains the state necessary to transform incoming data objects
Each factory can accept certain data types and return certain others. They are functions with state

---

Examples of data:

button tap
text
system..
view configuration

