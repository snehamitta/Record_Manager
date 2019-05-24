all: test1 test2 interface



test2: storage_mgr.c test_expr.c dberror.c record_mgr.c buffer_mgr_stat.c buffer_mgr.c expr.c rm_serializer.c
	gcc -g -Wall record_mgr.c buffer_mgr_stat.c buffer_mgr.c expr.c rm_serializer.c storage_mgr.c test_expr.c dberror.c -o expr
test1: storage_mgr.c test_assign3_1.c dberror.c record_mgr.c buffer_mgr_stat.c buffer_mgr.c expr.c rm_serializer.c
	gcc -g record_mgr.c buffer_mgr_stat.c buffer_mgr.c expr.c rm_serializer.c storage_mgr.c test_assign3_1.c dberror.c -o assign3

interface: storage_mgr.c interface.c dberror.c record_mgr.c buffer_mgr_stat.c buffer_mgr.c expr.c rm_serializer.c
	gcc -g storage_mgr.c interface.c dberror.c record_mgr.c buffer_mgr_stat.c buffer_mgr.c expr.c rm_serializer.c -o interface

runTest1: assign3
	./assign3

runTest2: expr
	./expr

runInterface: interface
	./interface