###Assignment 3 - Record Manager


##### To Build: `make all`


##### To Run Test 1(test_assign3_1.c) : `make runTest1`


##### To Run Test 2(test_expr.c) : `make runTest2`


This project is to implement a record manager on top of the storage and buffer manager designed. The basic functionalities of the code is described below:


extern RC initRecordManager (void *mgmtData);
This function just initializes the record manager on being called. Another way to activate the record manager.


extern RC shutdownRecordManager();
This function is called to just shut down the record manager


extern RC createTable (char *name, Schema *schema);
This function creates a Table. It allocates memory to all the data required in creating the table. It also initializes the global schema pointer, as that pointer is used in other functions to access the schema variables. It initalizes all the pointers, assigns the inital values. The data extraced from schema is written in memory, and that page is pinned, for other functions to use and read the data stored in it.


extern RC openTable (RM_TableData *rel, char *name);
This function allocates memory to all the pointers. It assigns the schema defined in the global schema to the given table.


extern RC closeTable (RM_TableData *rel);
This function closes the table.


extern RC deleteTable (char *name);
This function deletes the table.


extern int getNumTuples (RM_TableData *rel);
This function returns the number of tuples in the table.


extern RC insertRecord (RM_TableData *rel, Record *record);
This function inserts the records in the table, according to the Record ID. It also pushes in the number of slots and number of tuples.


extern RC deleteRecord (RM_TableData *rel, RID id);
This function delets the given record.


extern RC updateRecord (RM_TableData *rel, Record *record);
This function updates the record based on the given record ID. 


extern RC getRecord (RM_TableData *rel, RID id, Record *record);
This function returns the record based on the record ID.


extern RC startScan (RM_TableData *rel, RM_ScanHandle *scan, Expr *cond);
This functions initalizes all the pointes and allocates memory required to scan the table. It remembers total number of tuples to scan.


extern RC next (RM_ScanHandle *scan, Record *record);
This function iterates over the tuples and scans them, this funciton is called recursively until the number of tuples to scan are over.


extern RC closeScan (RM_ScanHandle *scan);
This function ends the scan process.


extern int gerRecordSize (Schema *schema);
This function returns the record size.


extern Schema *createSchema (int numAttr, char **attrNames, DataType *dataTypes, int *typeLength, int keySize, int *keys);
This function allocates memmory for a schema. Sets all the given attributes required for other fucntions.


extern RC freeSchema (Schema *schema);
This function frees the memory allocated for the schema in create schema funciton.


extern RC createRecord(Record **record, Schema *schema);
This function creates allocates memory for the record, memory is allocated for the data attribute according to size of given schema.


extern RC freeRecord (Record *record);
This function frees the memory allocated for the given record.


extern RC getAttr (Record *record, Schema *schema, int attrNum, Value **value);
This function returns the requested attribute.


extern RC setAttr (Record *record, Schema *schema, int attrNum, Value *value);
This function sets attributes.

**We are working on the interface as an addition. So far, we have the admin portal created and are still working on the methods.