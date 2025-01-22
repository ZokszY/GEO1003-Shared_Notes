## Position, Location, Place and Area

Aspects of addressing space:

* **Reference**: relative (with reference to space or other objects) or absolute (agreed to by general consensus)
* **Specificity** and **Uncertainty**: the extent of the addressable space
* **Scope**: placement at different scales
* **Context**: with or without context

|  | Position | Location | Place | Area |
| :---- | :---- | :---- | :---- | :---- |
| **Reference** | Absolute (e.g. coordinate system) | Absolute (e.g. room number) | Relative, placement in a room (inside) | Relative, placement in an aggregation of rooms |
| **Specificity/ Uncertainty** | Depends on the device providing the position | Certain, defined by the physical borders (walls) | Uncertain, defined by the functional space of an object (e.g. desk) | Uncertain, defined by a more general notations (floors, parts of building) |
| **Scope** | Defined by a reference frame | Contains places | Contained in locations | Contains locations |
| **Context** | No context | Context | Context | Context |
| **Example** | “I am at 28.2314° \- 33.4577°” | “I am in the living room” | “I am at the photocopier” | “I am on the second floor” |

Four concepts of placement:

* **Position:** pin-point placements
* **Location:** smallest physically defined space in a building
* **Place:** placement of particular object and the uncertain (functional) space around it
* **Area:** generalised space or sub-space, containing multiple addressable locations

Framework modelling indoor space composed of:

* **Agents**: entities that navigate space, access resources and perform activities
* **Resources**
* **Space**: entirety of the enclosed environment to be navigated
* **Sub-spaces**
  * ***Inert spaces***: inaccessible by agents
  * ***Free spaces***:
    * Allow agents to move through them
    * Contain resources
    * Host activities
* **Modifiers**:
  * Can be applied to sub-spaces, agents and resources
  * Define the environment of a sub-space, a sub-space can be encumbered by multiple modifiers
* **Activities**

**Network models**: graph structure G(V, E) representing indoor space

* Nodes V: subdivisions
* Edges E: topological relationship between nodes
