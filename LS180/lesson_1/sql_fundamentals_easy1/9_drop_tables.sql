/*
It seems we are done with our birds table, and no longer have a need for it in our animals database.
Write an SQL statement that will drop the birds table and all its data from the animals database.
*/

/* To just drop the table */
DROP TABLE birds;

/* To check if the table exists first to avoid an error */
DROP TABLE IF EXISTS birds;

/* To drop multiple tables at once */
DROP TABLE birds, reptiles;