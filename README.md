# Center (code name)
Dynamic system builder for iOS

## Introduction

The idea for Center started out as dual efforts: to make an awesome productivity app and to understand how our brains work. After all, an awesome productivity app should feel like a natural extension of our brain. So, I started doing research on different tools that could work. Here are some (not all) that I tried:
* Every to-do app I could find (OmniFocus, Reminders, Wunderlist, etc...)
* MindNode
* Dynalist
* Emacs Org-Mode
* Scrivener
* Paper and pencil
* Notion.so
* macOS (files & folders)
* Pages, notes, and different text editors
* MediaWiki (and other wiki software)
* Numbers, Excel
* Trello
* JIRA
* AnyLogic
* TwoBird
* iOS / macOS Calendar, Google Calendar

What I found out was that apps some excelled in certain areas (organizing tasks) but failed hard at others (organizing information). Some were good at cross-referencing items but didn't have any way to track state. Essentially, what I wanted was the flexibility of functional programming with the persistence of a database. The closest solution I found was macOS - it has the ability to organize many types of information and with  automated tools (Hazel) I got pretty far. However, macOS has weaknesses with hyperlinks and tasks. Personally, I don't want to use the Reminders app, but I'd rather create a file that represents a task that needs to be completed. The final problem (for me) with macOS is that applications diverge from the typical file structure and are too segmented.

So, I created a huge document consolidating all of my research, examples, test projects, and requirements. Right now, it's more than 100k words long (but most of it isn't useful). I trimmed as much as I could to figure out what a useful app would be; this document is the main result. It's a rough draft, so feel free to edit anything or add clarifications. 

The next sections detail the building blocks of the app. The fundamental structure is a system, which is composed of stocks and flows. There are specialized cases of each of these types, as well as other concepts such as dimensions, states, and more that I found necessary to actually support the basic functionality. Notes fill in a gap of information organizing, events take on the role of task-management, and processes allow for something similar to Siri Shortcuts (meta-programming of a sort).

## What are Systems?

There are quite a few books that talk about systems, one that I found to be useful was [Thinking in Systems](https://www.goodreads.com/book/show/3828902-thinking-in-systems) which gives a simple overview of the main concepts. It contains some authorship bias, but I think that the main content is worth the read. 

At the most fundamental, systems:
* are defined by boundaries
* are composed of stocks and flows
* consume input and produce output
* contain a goal inherent in their design

Systems can have arrangements of stocks and flows that create feedback loops. These loops either amplify or minimize disturbances to the system. These feedback loops are commonly known as reinforcing and balancing feedback loops.

Systems can fail if they exhaust their own stocks or if they exhaust the stocks of the parent system. When a system enters a failure state, it doesn't contain the ability to return to dynamic equilibrium even if it eventually can collect enough resources again.

Systems can be connected to other systems in a hierarchy or a network of connections. Some systems are arranged in a way that allows for easy information processing, others are arranged for resource accumulation. The configuration of a system determines its behavior. This configuration is the real goal of the system, even if the stated goal of the system is otherwise.

Some example systems:
* Businesses
* Organisms
* Information systems
* Software & networking
* The economy
* Intelligence
* Politics

## Fundamental Components

> One should avoid complexities of control and concentrate on organizing the data to reflect the real structure of the world being modeled, SICP 2nd Edition

The different system components for use in this app are listed here. These are really the atomic components because each of them is essential and indivisible. They are:
* Stocks
* Flows
* Events
* Goals

### Stocks

Stocks can be any quantity, measured or calculated. This quantity falls within a range along a dimension of measurement. The boundary of a system is defined by the minimum and maximum values that each stock can have.

![Dimensions](https://raw.githubusercontent.com/joshgrant/Center/master/README%20Images/Dimensions.png)

From _Thinking in Systems_:
* Stocks are the present memory of the history changes of the flows of a system
* Stocks act as delays, buffers, or shock absorbers for when the flows of a system change quickly
* System momentum is determined by how quickly stocks fill and empty
* Stock levels can influence the behavior of a system

### Flows

Flows transfer a certain amount of an input stock to an output stock. If these stocks aren't in the same dimension, a flow can convert the input stock to the output stock via a formula. Also flows can change quickly while stocks generally do not.

Flows can be limited by a few conditions:
* The flow rate (diameter of a pipe)
* The input stock (no more water in hot water tank)
* The output stock (the bathtub is full)

Flows can also have delays as well as ramp-up and ramp-down conditions. For example, a flow might take 10 seconds to begin, 5 seconds to reach full force, and 5 seconds to shut off.

### Events

At the most basic, events monitor stock levels and trigger flows. Events are crucial to having a system operate semi-autonomously. However, it's important to note that events do not monitor flow states but only stock levels. Events use conditions to check the stock level whenever it changes and possibly trigger a flow. Some stocks that can be measured:
* The current date
* The uptime of the program
* HealthKit data
* Results from external sources (IFTTT, Zapier, Siri Shortcuts, etc)
* The stock level of any system in the app

Of course, events that trigger on a certain date should be synced with the iOS or Google calendar if necessary.

### Goals

The goal of a system really is the ideal values of each of the stocks in that system. Because certain systems can be state-machines (see the section on state), goals can also represent ideal states. 

Goals influence system behavior in the following way:
1. The user gives an ideal value to a stock
1. The stock reports its delta to ideal to the parent system
1. The parent system prioritizes each non-ideal stock where the largest delta has highest priority
1. The parent system selects the highest priority stock and triggers (or suggests to the user) relevant flows

How does a system know which flows are relevant? Each flow contains information about which stocks it drains and which stocks it fills. The parent system can activate the flows that bring the priority stock back into balance.

Goals can sometimes compete when a parent system and a child system have conflicting objectives. This creates inefficiency and its possible that the systems can enter a failure state (which is relatively common among systems that don't have enough corrective mechanisms).

Goals can also move over time; by creating a stock with a goal that is larger than its current level, it's possible to create a positive feedback loop that continues to accumulate resources. This can also cause system failure if left unchecked.

Lastly, goals need to account for loss functions that increase when the self-corrective feedback loop increases. This means that certain flows become less efficient at scale and goals can be constantly underachieved.

## Abstract Components

Abstract components are parts of the system that don't necessarily exist but are emergent from system behavior.
* Feedback loops
* Source & Sink

### Feedback Loops

* Feedback loops are an arrangement of stocks and flows that either balance or change a system. 
* Feedback loops can only affect future behavior because there is always a delay (however small) between the triggering event and the actual resource transfer.

Feedback loops can also compete - generally a system exhibits behavior of the dominant feedback loop. A system can be in a state of dynamic equilibrium when it regularly alternates the dominant feedback loop. This is also known as a state of homeostasis.

Feedback loops can be two types:
* Balancing
* Reinforcing

##### Balancing feedback loops

Also known as negative feedback loops, balancing feedback loops resist changes to a system. They do this by trying to maintain a stock level at an absolute value. Every change to the stock level is minimized by trying to return to this absolute value.

#### Reinforcing feedback loops.

Also known as positive feedback loops, reinforcing feedback loops amplify changes to a system. The main mechanism is via setting an ideal stock level that is relative to the current stock level. In this loop, every change is amplified. Reinforcing feedback loops often cause state changes in the system that activate balancing feedback loops to keep the positive feedback loop in check.

The doubling rate of a stock level is approximately `70/rate of growth` (from _Thinking in Systems_).

### Source & Sink

A source and a sink are essentially infinite stocks that any system can use. Input from a source and output to a sink are limitless. They are essential when creating systems from scratch. Otherwise, systems would have no way to "start" because no resources could exist.

Source & sink exist as valid stocks for every system throughout the program.

## Utility Components

Utility components are small pieces of the puzzle that tie everything together. They are generally simple data structures that the user can create to describe whatever system they have in mind. 

### Condition

A condition is just an equation that checks the value of a stock (and can also be used in search). This generally is in the form of basic equality operators: `>`, `=`, `<`, `>=`, `<=`. Conditions take an input and produce a `boolean` if the input satisfies the equation. Conditions are used most heavily with events to determine if the event should fire.

Conditions can also be nested, i.e all sub-conditions must be true to satisfy the parent condition. 

### Conversion

Conversions are used by flows if the flow's stocks don't have the same type. For example, one stock can be `BTC`, the flow can be `Sell`, and the final stock can be `USD`. Because BTC and USD aren't exchangable 1:1, the conversion contains the ratio between the two types. Conversions are reversible by default, but some aren't (for example you can't turn a cake back into eggs and flour).

Conversions can also have a loss-function (for example, buy/sell fees) which reduces the amount of material transferred in the flow.

### Dimensions

Dimensions (or "types") represent the number-line that stocks can exist on - in fact stocks require dimensions. A dimension such as "money" is distinct from another dimension such as "number of jellybeans". Because dimensions don't have limits, it's the responsibility of stocks to set the system boundaries with maximum and minimum values.

Dimensions give the program the knowledge it needs to be able to exchange stocks of the same type. Dimensions work hand-in-hand with conversions to allow for exchanging stocks of different types. 

### States

States are just user-named ranges (these are along the temperature dimension):

For example, temperature can be 
* freezing
    * -infinity ..< 0°C
* cold
    * 0°C ..< 15°C
* mild
    * 15°C ..< 24°C
* hot
    * 24°C ..< 32°C
* sweltering
    * 32°C ..< 45°C
* fatal
    * 45°C ..< +infinity

Of course, states are just a useful abstraction and can be quite different from one user to another. 

It's valid to also name similar states (ignoring plasma):
* solid
    * -infinity ..< 0°C
* liquid
    * 0°C ..< 100°C
* gas
    * 100°C ..< +infinity
    
The user can create states to reduce cognitive load (dealing with words rather than numbers) as well as setting "ideal states" that stocks can work towards. State changes can also trigger events. Of course, states are a useful, but optional feature.

----

Let's take a concrete example and see how the concepts apply:

## Cafeteria:

This is a really simple and boring example but perhaps it puts some of the ideas into context.

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


### Events:

* 6:00 A.M
    * activate the "prepare food" flow
* 8:00 P.M
    * activate the "throw out food" flow
* hot food < 10 kilograms
    * activate the "prepare food" flow
* external trigger (user buys food)
    * activate the "sell food" flow

---

## System relationships

Systems can form relationships via how they connect stocks and flows to other systems. Here are the basic types:
* Hierarchy
* Series
* Network

Of course, every collection of systems can have one or more of the relationship types above.

### Hierarchy (needs work)

System hierarchy is when a system contains another

Subsystem inputs and outputs come and go from the parent system

Subsystems have a lower priority than parent systems when resolving imbalance

Subsystems act as "modules" and serve to encapsulate functionality / reduce complexity of the parent system

Subsystems must coordinate only with their parent

Hierarchical systems are the most efficient form of relationships in systems (therefore the most general)

### Series (needs work)

Systems that have a single input and a single output to different systems can form a series

A series is a process of steps that can convert input through many stages

This is like an assembly line

Series are the most restricted form of relationships in systems (therefore the most relaible and fixable)

### Network (needs work)

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

#### Processes (needs work)

Processes are the least developed part of the app so far. I think they can also have the most power in the future; for now they are simple procedures that convey information about steps to be taken. In code, they would be the function body. In business, the policies and rules that govern how the business is run.

Processes can:
* be nested
* use the state of the system as well as external information to follow a set of steps
* modify the state of the system (produce and consume stocks, trigger flows via events)
* 

Processes are condition trees that are nested

Processes use the current state of the system and external/user input to progress through the process

Processes can consume and produce stocks 

Processes are in essence flows that are more specialised for task completion

Processes can be re-used (unlike to-do lists, they don't disappear when completed)

Processes can affect stocks and can be used as the "recommended" action for a system to resolve its imbalance

A step in a process can have iOS hooks: share sheet, email sheet, call a number

A step in a process can also trigger external sources (Zapier, etc) 

_Note_: this needs to be refined because should flows trigger external sources? Perhaps...

#### Notes (needs work)

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

##### Auto-wiki (needs work)
The notes have a hidden feature which creates the "related notes". Each note's blocks are analyzed for its word content in the background. The words are compared across all notes (via a central syncing database) and notes with similar content show up in each other's "related" section. Additionnally, matched words or groups of words show as a hyperlink between notes. If there is a naming collision (e.g three notes with the phrase "cool beans") then tapping on the link opens a disambiguation page - really the "search" page with multiple results.

In addition, notes can be "linked" to different systems, stocks, events, flows, etc. This way, systems can be described in more detail if necessary.
Notes can be directly created from systems, stocks, etc

#### History (needs work)

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

#### Dashboard (needs work)

The dashboard is the quick-digest overview for the user

They can pin any system, stock, flow, note, etc

Every flow that requires user-input to activate shows up here

Every event that has a future execution date shows up here (in the forecast)

The dashboard shows the systems that are the most out of balance (sorted by priority) 
