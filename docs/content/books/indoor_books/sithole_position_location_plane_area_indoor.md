
## Position Location Place and Area - An Indoor Perspective

### Introduction

"In contemporary navigational systems, travel between a start point and destination are imagined to be movements between pin-points in space. But as humans we seldom think in this way when travelling. Our conception of ‘Here’ and ‘There’ is more complex."

This paper looks at "how to model the dynamic interactions within indoor spaces, and specifically defining the elements that are required to model interactions within indoor spaces."

* Part 1: reviews the notions of ‘Position’, ‘Location’, ‘Place’, and ‘Area’
* Part 2: explores how these notions translate in indoor environments
* Part 3: proposes the inclusion of these notions into an indoor modelling framework (previously developed by the authors)

### Part 1 - Overview: position, location, place and area

Three major approaches for representing spatial relationships:

* **Metric**
* **Topology**: represents neighbourhood relationships between two objects, which allows the definition of inclusion (‘in’) and closeness (meet, or next to)
* **Directional**: require a specific frame of reference, namely
  * **Intrinsic**
  * **Deictic**
  * **Extrinsic**
  * **Euclidian**: makes directional relationships unambiguous

Spatial references:

* **Relative references**: expressions of placement are relative, with reference to space or other objects or things in space
* **Absolute references**: relative references that are fixed and agreed to by general consensus (e.g. latitude and longitude)
* Spatial references can be thought of as addresses to placement in space

Aspects of addressing:

* **Reference**: relative or absolute
* **Specificity** and **Uncertainty**: the extent of the addressable space
* **Scope**: placement at different scales, introduces the concept of the topological nesting of spaces
* **Context**: with or without context

|  | Position | Location | Place | Area |
| :---- | :---- | :---- | :---- | :---- |
| **Reference** | Absolute (e.g. coordinate system) | Absolute (e.g. room number) | Relative, placement in a room (inside) | Relative, placement in an aggregation of rooms |
| **Specificity/ Uncertainty** | Depends on the device providing the position | Certain, defined by the physical borders (walls) | Uncertain, defined by the functional space of an object (e.g. desk) | Uncertain, defined by a more general notations (floors, parts of building) |
| **Scope** | Defined by a reference frame | Contains places | Contained in locations | Contains locations |
| **Context** | No context | Context | Context | Context |
| **Example** | "I am at 28.2314° \- 33.4577°" | "I am in the living room" | "I am at the photocopier" | "I am on the second floor" |

### Part 2 - An indoor perspective of position, location, place, and area

Four concepts of placement:

* **Position**
  * A Cartesian reference system is defined for a building, positions are defined relative to this system
  * Positions provide pin-point placements
* **Location**
  * Location refers to the smallest physically defined space in a building
  * Location defines a general placement relative to well-defined physical space
* **Place**
  * Place refers to a particular object and the uncertain (functional) space around it
  * Place is used to indicate placements, which are within locations and have uncertain or dynamic limits
* **Area**
  * Area defines a generalised space or sub-space, containing multiple addressable locations

### Part 3 - Indoor navigation framework

Conceptual framework is composed of:

* **Agents**: entities that navigate space, access resources and perform activities
* **Resources**
* **Space**: entirety of the enclosed environment to be navigated
* **Sub-spaces**
  * ***Inert spaces***: are inaccessible by agents
  * ***Free spaces***:
    * Allow agents to move through them
    * Contain resources
    * Host activities
* **Modifiers**:
  * Can be applied to sub-spaces, agents and resources
  * Define the environment of a sub-space, a sub-space can be encumbered by multiple modifiers
* **Activities**

In a navigation event an agent moves between free sub-spaces and either accesses resources or engages in activities.

"Indoor navigation systems are built on top of **partition-maps** (or subdivision maps) of indoor spaces. These partition-maps are obtained by subdividing indoor spaces such that they reflect cognitive spatial schemas of most users (agents)."

**Network models**: "The subdivisions (e.g., rooms, stairs, etc.,) are represented by nodes, V, and the topological relationship between the nodes is captured by the edges, E. The nodes and edges are commonly stored in a graph structure, G(V, E)."

*Note: After this the updated conceptual framework is explained, however, I think/hope this much detail will not be asked in the exam.*
