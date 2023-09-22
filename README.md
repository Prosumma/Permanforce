# Permanforce

The name "Permanforce" is a nonsensical anagram of "Performance". I needed a name and there it is.

## Architecture

The architecture of this application makes heavy use of _type-oriented development_. It is driven by strong types and makes heavy use of polymorphism, including generics, protocols, associated types, etc.

The architecture is heavily driven by its models, all of which implement the `Named` protocol. This protocol allows the view layer to find the name of the model, determine how to display its image, etc. In this way, it's not necessary to have separate views for `Artist`, `Venue`, `Performance`, etc. In fact, a single view, `NamedItem`, is used to display all of these, and a list of them is displayed with `NamedItemList`.

