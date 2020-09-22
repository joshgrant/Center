# Center
Dynamic system builder for iOS

## What is the purpose of the app?
First, we need to understand systems. Systems are a fundamental tool, one of the most basic tools we have to analyze the world. 
* Political systems
* Businesses
* Organisms
* Information systems
* Software & the internet
* Economy
* Intelligence

This app aims to be the best way to model systems. Of course, it will have to see a lot of iterations to reach this goal.

## What are systems?

Systems have a purpose, objective, or goal

Systems can be connected to other systems

Systems are composed of stocks, flows, and feedback loops

Systems have inputs and outputs

For some systems, input comes from "source" and output goes to "sink" which are just symbolic...

"Source" is an infinite repository of material, a system can draw from it forever

"Sink" is an infinite output, a system can send it output forever

### System Components

#### Dimensions

Dimensions are simply an axis of measurement, like a number line

A more complex system has more dimensions


#### Stocks

Stocks can be any quantity, measured or calculated

The value of a stock falls on a number-line in a dimension of what it's measuring

Larger stocks act as a time-delay buffer that gives a system stability and makes it less chaotic

A system's boundaries are determined by setting the maximum and minimum stock values

![Dimensions](/README\ Images/Dimensions.png)

#### States

States are just named ranges (I'm not being too precise for these examples) of values of a stock

For example, temperature can be 
* "freezing" from "-infinity -> 0°C"
* "cold" from "0°C -> 15°C"
* "warm" from "15°C -> 30°C"
* "hot" from "30°C -> 40°C"
* "unbearable" from "40°C -> +infinity"

Of course, states are just a useful abstraction and can be quite different from one user to another

It's valid for me to also name similar states:
* "solid": "-infinity -> 0°C"
* "liquid": "0°C -> 100°C"
* "gas": "100°C -> +infinity" (you can add "plasma" if you like)

In essence, giving states different names is just useful and arbitrary.

#### Flows
Flows simply transfer a certain amount from one stock to another

Flows are triggered by events (for example time, the condition of a system, or external input)

Flows can use a conversion if types aren't interchangable (usually ratio-based)
* For example, I can convert BTC to USD even though they aren't the same type
* The ratio of BTC to USD determines how a conversion works
* Conversions can be one-way or reversible
* Conversions can have a loss-function (advanced feature) which reduces the amount transferred in the flow

Flows can be limited by a few things:
* Flow rate (the pipe is too small)
* Input stock limits (no more water in the water tank)
* Output stock limits (the bathtub is full)

#### Feedback loops

Feedback loops are either balancing or reinforcing

Balancing feedback loops aim to maintain homeostasis of the system

In a system with dominant balancing loops, every change is minimized

Reinforcing feedback loops aim to make a state change of the system

In a system with dominant reinforcing loops, every change is amplified

In a system with dominant reinforcing loops, the loop requires greater resources from preserved stocks

Usually systems have a mix of balancing and reinforcing feedback loops that form a dynamic equilibrium

#### Goals

Goals can be real (i.e value measurements) or stated (text description)

Goals can be a value of a stock, or a state (which is just a range of stock values)

System goals are managed by a meta-system (the user)

Goals are assigned to different stocks by giving an "ideal" value to that stock

Super-system goals take precedence over sub-system goals

The further the measured value is from the ideal value, the more out-of-balance a system is

The more out-of-balance a system, the higher priority/stronger signal the system receives to resolve its imbalance

When subsystem goals are aligned with the super-system goals, the system operates efficiently

Goals can change over time or be updated as necessary

Goals can also be set by the super system via experimentation (what is required to achieve a steady state)

Sometimes a system can have multiple goals that work in-tandem

Because a system knows which flows can influence the stock that is not-ideal, a system can "recommend" flows to activate

#### Events

Events trigger flows under certain conditions

Conditions can include:
* Specific dates
* Date patterns (i.e first of every month)
* Tick time (run time of the program)
* User input
* External input (IFTTT, Zapier, Siri Shortcuts, etc)
* System state (stock levels, flow activation)
* And more

Future date events should sync with a calendar (iOS, Google)

----

Let's take a concrete example and see how the concepts apply:

## Cafeteria:

### Goal:

~~serve food to students at lunch time~~

~~every student who wants food at lunch can buy food~~

~~minimize food waste~~

maximize food sales and minimize food waste

### Units:

* liters
* kilograms

### Dimensions: 

* fridge food
* hot food
* money
* employees

### Stocks: (amount) (unit) (dimension)

* 500 kilograms fridge food
* 30 kilograms hot food
* 500 money
* 5 employees

### Flows:

* prepare food
     * frigde food -> hot food

* sell food
    * hot food -> out
    * out -> money

* throw out food
    * hot food -> out

---

## System relationships
 
Systems can have _hierarchy_ which means that the inputs and outputs of a system come and go to the same system

Systems can be in _series_ which means that the inputs comes from one system and the outputs go to another

Systems can also form a _network_ which means that inputs and outputs connect many different systems

Of course, every collection of systems can have one or more of the relationship types above.

### Hierarchy

System hierarchy is when a system contains another

Subsystem inputs and outputs come and go from the parent system

Subsystems have a lower priority than parent systems when resolving imbalance

Subsystems act as "modules" and serve to encapsulate functionality / reduce complexity of the parent system

Subsystems must coordinate only with their parent

Hierarchical systems are the most efficient form of relationships in systems (therefore the most general)

### Series

Systems that have a single input and a single output to different systems can form a series

A series is a process of steps that can convert input through many stages

This is like an assembly line

Series are the most restricted form of relationships in systems (therefore the most relaible and fixable)

### Network

Systems that have input and output from many simultaneous sources create a network

Neural networks are systems where the inputs and outputs are "signals" which are just pure numerical values

Neural networks also contain "stocks" which can represent the activation state of neurons

Networks can store information as well as process information

A network is the most general form of relationship in systems (therefore the most abstract and useful for information processing)

---

We'll introduce a few concepts to make the app more usable:
* Processes
* Notes
* History
* Links
* Dashboard
* Library

#### Processes

Processes are condition trees that are nested

Processes use the current state of the system and external/user input to progress through the process

Processes can consume and produce stocks 

Processes are in essence flows that are more specialised for task completion

Processes can be re-used (unlike to-do lists, they don't disappear when completed)

Processes can affect stocks and can be used as the "recommended" action for a system to resolve its imbalance

A step in a process can have iOS hooks: share sheet, email sheet, call a number

A step in a process can also trigger external sources (Zapier, etc) 

_Note_: this needs to be refined because should flows trigger external sources? Perhaps...

#### Notes

Notes are again systems, but specialized for note-taking

Each note is composed of blocks

Blocks are systems with different stocks:
* Text
* Style
* Color
* Link
* Photo
* Etc...

Each block's input is the block before

Each block's output is the next block

Blocks can be specailized (i.e a graph or a table)

For an example of a similar block system, check out Gutenberg by Wordpress

##### Auto-wiki
The notes have a hidden feature which creates the "related notes". Each note's blocks are analyzed for its word content in the background. The words are compared across all notes (via a central syncing database) and notes with similar content show up in each other's "related" section. Additionnally, matched words or groups of words show as a hyperlink between notes. If there is a naming collision (e.g three notes with the phrase "cool beans") then tapping on the link opens a disambiguation page - really the "search" page with multiple results.

In addition, notes can be "linked" to different systems, stocks, events, flows, etc. This way, systems can be described in more detail if necessary.
Notes can be directly created from systems, stocks, etc

#### History

History tracks state changes for systems and processes by copying the system state before a state change

Things that are saved in history:
* A stock's value
* A flow's activation date
* An event's trigger date
* A note block's previous content
* A process block's completion date

Not every thing is tracked in history changes (such as when a goal is changed, or a state is added)

Different histories can be "loaded" which resets the value to the historical value

Histories can branch when loaded from the past

#### Dashboard

The dashboard is the quick-digest overview for the user

They can pin any system, stock, flow, note, etc

Every flow that requires user-input to activate shows up here

Every event that has a future execution date shows up here (in the forecast)

The dashboard shows the systems that are the most out of balance (sorted by priority) 
