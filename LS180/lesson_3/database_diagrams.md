# Levels of Schema
## Conceptual
High-level design focused on identifying entities and their relationships.
Concerned mostly with bigger objects and higher level concepts.

### Entity-Relationship Model
Focuses purely on the entities and how they are related. This model is a conceptual schema

one-to-one, one-to-many, many-to-many.

Example:
A contact on a phone can have many calls associated with them.(one-to-many)

#### one-to-one
In practice, a 1::1 relationship normally uses the same column for both the primary key and the foreign key in one of the two tables. One-to-one relationships are rare.

#### one-to-many
The 'one' entity tends to have a primary key while the 'many' entity has a foreign key representing that relationship.

#### many-to-many
Both entities have their primary keys and an extra 'join table' holds the foreign keys.

## Logical
Contains more detail than the conceptual level and is concerned with implementation on the database, just not a specific database.

## Physical
Low-level database-specific design focused on implementation.
Concerned primarily with the database specific implementation of the conceptual model.

The number of entities we have on a higher level schema doesn't always match the number of tables at the lower levels.(We might have to add join tables for example)

The implementation of the one-to-many example used in 'entity-relationship model' (the actual tables) would be an example of the physical level.



# Cardinality and Modality
Cardinality: The number of objects on each side of the relationship.(1:1, 1:M, M:M)
Modality: Determines if the relationship is required(1) or optional(0).

Example:
An author must have one or more books and a book must have an author.(1:M)(Both entities are required)

## Crow's Foot Notation
Database diagram notation that represents relationships, modality and cardinality using lines and circles.