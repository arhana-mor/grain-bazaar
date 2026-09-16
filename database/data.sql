
INSERT INTO farmers (farmer_id, farmer_phone, first_name, last_name) VALUES ('F101', 9876543210, 'Rajesh', ' Kumar');                                           
                                                                                
INSERT INTO farmers (farmer_id, farmer_phone, first_name, last_name) VALUES ('F102', 9812345670, 'Suresh', ' Singh');                                           
                                                                                
INSERT INTO farmers (farmer_id, farmer_phone, first_name, last_name) VALUES ('F103', 9823456781, 'Anil', ' Gupta');                                             
                                                                                
INSERT INTO farmers (farmer_id, farmer_phone, first_name, last_name) VALUES ('F104', 9834567892, 'Deepak', ' Yadav');                                           
                                                                                
INSERT INTO farmers (farmer_id, farmer_phone, first_name, last_name) VALUES ('F105', 9845678903, 'Mohan', ' Lal');                                              
                                                                                


INSERT INTO customers (customer_id, customer_phone, first_name, last_name) VALUES ('C201', 9123456780, 'Amit', 'Sharma');                                       
                                                                                
INSERT INTO customers (customer_id, customer_phone, first_name, last_name) VALUES ('C202', 9234567810, 'Neha', 'Verma');                                        
                                                                                
INSERT INTO customers (customer_id, customer_phone, first_name, last_name) VALUES ('C203', 9345678120, 'Rohit', 'Mehta');                                       
                                                                                
INSERT INTO customers (customer_id, customer_phone, first_name, last_name) VALUES ('C204', 9456781230, 'Pooja', 'Kapoor');                                      


INSERT INTO customers (customer_id, customer_phone, first_name, last_name) VALUES ('C205', 9567812340, 'Karan', 'Malhotra');                                    
                                                                                
INSERT INTO customers (customer_id, customer_phone, first_name, last_name) VALUES ('C206', 9678123450, 'Sneha', 'Reddy');                                       
                                                                                


INSERT INTO grain (grain_id, grain_name) VALUES (1, 'Wheat');                   
INSERT INTO grain (grain_id, grain_name) VALUES (2, 'Rice');                    
INSERT INTO grain (grain_id, grain_name) VALUES (3, 'Maize');                   
INSERT INTO grain (grain_id, grain_name) VALUES (4, 'Barley');                  



INSERT INTO transaction (transaction_id, trans_date, farmer_id, customer_id, grain_id, quantity, price_per_unit) VALUES (5, TO_DATE('2026-05-07 11:24:30','YYYY-MM-DD HH24:MI:SS'), 'F103', 'C201', 4, 20, 20);                                 
                                                                                
INSERT INTO transaction (transaction_id, trans_date, farmer_id, customer_id, grain_id, quantity, price_per_unit) VALUES (1001, TO_DATE('2026-04-01 00:00:00','YYYY-MM-DD HH24:MI:SS'), 'F101', 'C201', 1, 50, 25.5);                            
                                                                                
INSERT INTO transaction (transaction_id, trans_date, farmer_id, customer_id, grain_id, quantity, price_per_unit) VALUES (1002, TO_DATE('2026-04-01 00:00:00','YYYY-MM-DD HH24:MI:SS'), 'F102', 'C202', 2, 40, 30);                              
                                                                                
INSERT INTO transaction (transaction_id, trans_date, farmer_id, customer_id, grain_id, quantity, price_per_unit) VALUES (1003, TO_DATE('2026-04-02 00:00:00','YYYY-MM-DD HH24:MI:SS'), 'F103', 'C203', 3, 60, 20);                              
                                                                                
INSERT INTO transaction (transaction_id, trans_date, farmer_id, customer_id, grain_id, quantity, price_per_unit) VALUES (1004, TO_DATE('2026-04-02 00:00:00','YYYY-MM-DD HH24:MI:SS'), 'F104', 'C204', 4, 35, 22.5);                            
                                                                                
INSERT INTO transaction (transaction_id, trans_date, farmer_id, customer_id, grain_id, quantity, price_per_unit) VALUES (1005, TO_DATE('2026-04-03 00:00:00','YYYY-MM-DD HH24:MI:SS'), 'F105', 'C205', 1, 55, 26);                              
                                                                                
INSERT INTO transaction (transaction_id, trans_date, farmer_id, customer_id, grain_id, quantity, price_per_unit) VALUES (1006, TO_DATE('2026-04-03 00:00:00','YYYY-MM-DD HH24:MI:SS'), 'F101', 'C206', 2, 45, 29.5);                            
                                                                                
INSERT INTO transaction (transaction_id, trans_date, farmer_id, customer_id, grain_id, quantity, price_per_unit) VALUES (1007, TO_DATE('2026-04-04 00:00:00','YYYY-MM-DD HH24:MI:SS'), 'F102', 'C201', 3, 70, 19.5);                            
                                                                                
INSERT INTO transaction (transaction_id, trans_date, farmer_id, customer_id, grain_id, quantity, price_per_unit) VALUES (1008, TO_DATE('2026-04-04 00:00:00','YYYY-MM-DD HH24:MI:SS'), 'F103', 'C202', 1, 30, 25);                              
                                                                                
INSERT INTO transaction (transaction_id, trans_date, farmer_id, customer_id, grain_id, quantity, price_per_unit) VALUES (1009, TO_DATE('2026-04-05 00:00:00','YYYY-MM-DD HH24:MI:SS'), 'F104', 'C203', 2, 65, 31);                              
                                                                                
INSERT INTO transaction (transaction_id, trans_date, farmer_id, customer_id, grain_id, quantity, price_per_unit) VALUES (1010, TO_DATE('2026-04-05 00:00:00','YYYY-MM-DD HH24:MI:SS'), 'F105', 'C204', 4, 25, 23);                              
                                                                                

INSERT INTO transaction (transaction_id, trans_date, farmer_id, customer_id, grain_id, quantity, price_per_unit) VALUES (1011, TO_DATE('2026-04-06 00:00:00','YYYY-MM-DD HH24:MI:SS'), 'F101', 'C205', 3, 80, 21);                              
                                                                                
INSERT INTO transaction (transaction_id, trans_date, farmer_id, customer_id, grain_id, quantity, price_per_unit) VALUES (1012, TO_DATE('2026-04-06 00:00:00','YYYY-MM-DD HH24:MI:SS'), 'F102', 'C206', 1, 60, 27);                              
                                                                                
INSERT INTO transaction (transaction_id, trans_date, farmer_id, customer_id, grain_id, quantity, price_per_unit) VALUES (1013, TO_DATE('2026-04-07 00:00:00','YYYY-MM-DD HH24:MI:SS'), 'F103', 'C201', 2, 50, 30.5);                            


INSERT INTO transaction (transaction_id, trans_date, farmer_id, customer_id, grain_id, quantity, price_per_unit) VALUES (1014, TO_DATE('2026-04-07 00:00:00','YYYY-MM-DD HH24:MI:SS'), 'F104', 'C202', 4, 45, 22);                              
                                                                                
INSERT INTO transaction (transaction_id, trans_date, farmer_id, customer_id, grain_id, quantity, price_per_unit) VALUES (1015, TO_DATE('2026-04-08 00:00:00','YYYY-MM-DD HH24:MI:SS'), 'F105', 'C203', 1, 75, 26.5);                            
                                                                                
INSERT INTO transaction (transaction_id, trans_date, farmer_id, customer_id, grain_id, quantity, price_per_unit) VALUES (1016, TO_DATE('2026-04-08 00:00:00','YYYY-MM-DD HH24:MI:SS'), 'F101', 'C204', 2, 35, 29);                              
                                                                                
INSERT INTO transaction (transaction_id, trans_date, farmer_id, customer_id, grain_id, quantity, price_per_unit) VALUES (1017, TO_DATE('2026-04-09 00:00:00','YYYY-MM-DD HH24:MI:SS'), 'F102', 'C205', 3, 55, 20.5);                            
                                                                                
INSERT INTO transaction (transaction_id, trans_date, farmer_id, customer_id, grain_id, quantity, price_per_unit) VALUES (1018, TO_DATE('2026-04-09 00:00:00','YYYY-MM-DD HH24:MI:SS'), 'F103', 'C206', 4, 40, 23.5);                            
                                                                                
INSERT INTO transaction (transaction_id, trans_date, farmer_id, customer_id, grain_id, quantity, price_per_unit) VALUES (1019, TO_DATE('2026-04-10 00:00:00','YYYY-MM-DD HH24:MI:SS'), 'F104', 'C201', 1, 65, 26);                              
                                                                                
INSERT INTO transaction (transaction_id, trans_date, farmer_id, customer_id, grain_id, quantity, price_per_unit) VALUES (1020, TO_DATE('2026-04-10 00:00:00','YYYY-MM-DD HH24:MI:SS'), 'F105', 'C202', 2, 50, 30);                              
                                                                                
INSERT INTO transaction (transaction_id, trans_date, farmer_id, customer_id, grain_id, quantity, price_per_unit) VALUES (1021, TO_DATE('2026-04-11 00:00:00','YYYY-MM-DD HH24:MI:SS'), 'F101', 'C203', 3, 70, 21);                              
                                                                                

INSERT INTO transaction (transaction_id, trans_date, farmer_id, customer_id, grain_id, quantity, price_per_unit) VALUES (1022, TO_DATE('2026-04-11 00:00:00','YYYY-MM-DD HH24:MI:SS'), 'F102', 'C204', 4, 30, 22.5);                            
                                                                                
INSERT INTO transaction (transaction_id, trans_date, farmer_id, customer_id, grain_id, quantity, price_per_unit) VALUES (1023, TO_DATE('2026-04-12 00:00:00','YYYY-MM-DD HH24:MI:SS'), 'F103', 'C205', 1, 55, 27);                              
                                                                                
INSERT INTO transaction (transaction_id, trans_date, farmer_id, customer_id, grain_id, quantity, price_per_unit) VALUES (1024, TO_DATE('2026-04-12 00:00:00','YYYY-MM-DD HH24:MI:SS'), 'F104', 'C206', 2, 45, 31);                              

INSERT INTO transaction (transaction_id, trans_date, farmer_id, customer_id, grain_id, quantity, price_per_unit) VALUES (1025, TO_DATE('2026-04-13 00:00:00','YYYY-MM-DD HH24:MI:SS'), 'F105', 'C201', 3, 60, 20);                              
                                                                                
INSERT INTO transaction (transaction_id, trans_date, farmer_id, customer_id, grain_id, quantity, price_per_unit) VALUES (1026, TO_DATE('2026-04-13 00:00:00','YYYY-MM-DD HH24:MI:SS'), 'F101', 'C202', 4, 35, 23);                              
                                                                                
INSERT INTO transaction (transaction_id, trans_date, farmer_id, customer_id, grain_id, quantity, price_per_unit) VALUES (1027, TO_DATE('2026-04-14 00:00:00','YYYY-MM-DD HH24:MI:SS'), 'F102', 'C203', 1, 80, 28);                              
                                                                                
INSERT INTO transaction (transaction_id, trans_date, farmer_id, customer_id, grain_id, quantity, price_per_unit) VALUES (1028, TO_DATE('2026-04-14 00:00:00','YYYY-MM-DD HH24:MI:SS'), 'F103', 'C204', 2, 50, 30);                              
                                                                                
INSERT INTO transaction (transaction_id, trans_date, farmer_id, customer_id, grain_id, quantity, price_per_unit) VALUES (1029, TO_DATE('2026-04-15 00:00:00','YYYY-MM-DD HH24:MI:SS'), 'F104', 'C205', 3, 65, 21.5);                            
                                                                                
INSERT INTO transaction (transaction_id, trans_date, farmer_id, customer_id, grain_id, quantity, price_per_unit) VALUES (1030, TO_DATE('2026-04-15 00:00:00','YYYY-MM-DD HH24:MI:SS'), 'F105', 'C206', 4, 45, 22);                              
                                                                                
INSERT INTO transaction (transaction_id, trans_date, farmer_id, customer_id, grain_id, quantity, price_per_unit) VALUES (1031, TO_DATE('2026-04-16 00:00:00','YYYY-MM-DD HH24:MI:SS'), 'F101', 'C201', 1, 55, 25.5);                            
                                                                                
INSERT INTO transaction (transaction_id, trans_date, farmer_id, customer_id, grain_id, quantity, price_per_unit) VALUES (1032, TO_DATE('2026-04-16 00:00:00','YYYY-MM-DD HH24:MI:SS'), 'F102', 'C202', 2, 60, 30.5);                            
                                                                                
INSERT INTO transaction (transaction_id, trans_date, farmer_id, customer_id, grain_id, quantity, price_per_unit) VALUES (1033, TO_DATE('2026-04-17 00:00:00','YYYY-MM-DD HH24:MI:SS'), 'F103', 'C203', 3, 75, 19.5);                            
                                                                                
INSERT INTO transaction (transaction_id, trans_date, farmer_id, customer_id, grain_id, quantity, price_per_unit) VALUES (1034, TO_DATE('2026-04-17 00:00:00','YYYY-MM-DD HH24:MI:SS'), 'F104', 'C204', 4, 40, 23.5);                            
                                                                                
INSERT INTO transaction (transaction_id, trans_date, farmer_id, customer_id, grain_id, quantity, price_per_unit) VALUES (1035, TO_DATE('2026-04-18 00:00:00','YYYY-MM-DD HH24:MI:SS'), 'F105', 'C205', 1, 65, 27);                              

INSERT INTO transaction (transaction_id, trans_date, farmer_id, customer_id, grain_id, quantity, price_per_unit) VALUES (1036, TO_DATE('2026-04-18 00:00:00','YYYY-MM-DD HH24:MI:SS'), 'F101', 'C206', 2, 35, 29.5);                            
                                                                                
INSERT INTO transaction (transaction_id, trans_date, farmer_id, customer_id, grain_id, quantity, price_per_unit) VALUES (1037, TO_DATE('2026-04-19 00:00:00','YYYY-MM-DD HH24:MI:SS'), 'F102', 'C201', 3, 80, 20);                              
                                                                                
INSERT INTO transaction (transaction_id, trans_date, farmer_id, customer_id, grain_id, quantity, price_per_unit) VALUES (1038, TO_DATE('2026-04-19 00:00:00','YYYY-MM-DD HH24:MI:SS'), 'F103', 'C202', 4, 30, 22.5);                      
                                                                                
INSERT INTO transaction (transaction_id, trans_date, farmer_id, customer_id, grain_id, quantity, price_per_unit) VALUES (1039, TO_DATE('2026-04-20 00:00:00','YYYY-MM-DD HH24:MI:SS'), 'F104', 'C203', 1, 70, 26);                              
                                                                                
INSERT INTO transaction (transaction_id, trans_date, farmer_id, customer_id, grain_id, quantity, price_per_unit) VALUES (1040, TO_DATE('2026-04-20 00:00:00','YYYY-MM-DD HH24:MI:SS'), 'F105', 'C204', 2, 50, 31);                              
                                                                                
INSERT INTO transaction (transaction_id, trans_date, farmer_id, customer_id, grain_id, quantity, price_per_unit) VALUES (1041, TO_DATE('2026-04-21 00:00:00','YYYY-MM-DD HH24:MI:SS'), 'F101', 'C205', 3, 60, 21);                              
                                                                                
INSERT INTO transaction (transaction_id, trans_date, farmer_id, customer_id, grain_id, quantity, price_per_unit) VALUES (1042, TO_DATE('2026-04-21 00:00:00','YYYY-MM-DD HH24:MI:SS'), 'F102', 'C206', 4, 45, 23);                              
                                                                                
INSERT INTO transaction (transaction_id, trans_date, farmer_id, customer_id, grain_id, quantity, price_per_unit) VALUES (1043, TO_DATE('2026-04-22 00:00:00','YYYY-MM-DD HH24:MI:SS'), 'F103', 'C201', 1, 75, 27.5);                            
                                                                                


INSERT INTO transaction (transaction_id, trans_date, farmer_id, customer_id, grain_id, quantity, price_per_unit) VALUES (1044, TO_DATE('2026-04-22 00:00:00','YYYY-MM-DD HH24:MI:SS'), 'F104', 'C202', 2, 40, 30);                              
                                                                                
INSERT INTO transaction (transaction_id, trans_date, farmer_id, customer_id, grain_id, quantity, price_per_unit) VALUES (1045, TO_DATE('2026-04-23 00:00:00','YYYY-MM-DD HH24:MI:SS'), 'F105', 'C203', 3, 65, 20.5);                            
                                                                                
INSERT INTO transaction (transaction_id, trans_date, farmer_id, customer_id, grain_id, quantity, price_per_unit) VALUES (1046, TO_DATE('2026-04-23 00:00:00','YYYY-MM-DD HH24:MI:SS'), 'F101', 'C204', 4, 35, 22);                              

INSERT INTO transaction (transaction_id, trans_date, farmer_id, customer_id, grain_id, quantity, price_per_unit) VALUES (1047, TO_DATE('2026-04-24 00:00:00','YYYY-MM-DD HH24:MI:SS'), 'F102', 'C205', 1, 80, 28);                              
                                                                                
INSERT INTO transaction (transaction_id, trans_date, farmer_id, customer_id, grain_id, quantity, price_per_unit) VALUES (1048, TO_DATE('2026-04-24 00:00:00','YYYY-MM-DD HH24:MI:SS'), 'F103', 'C206', 2, 55, 31);                              
                                                                                
INSERT INTO transaction (transaction_id, trans_date, farmer_id, customer_id, grain_id, quantity, price_per_unit) VALUES (1049, TO_DATE('2026-04-25 00:00:00','YYYY-MM-DD HH24:MI:SS'), 'F104', 'C201', 3, 70, 19.5);                            
                                                                                
INSERT INTO transaction (transaction_id, trans_date, farmer_id, customer_id, grain_id, quantity, price_per_unit) VALUES (1050, TO_DATE('2026-04-25 00:00:00','YYYY-MM-DD HH24:MI:SS'), 'F105', 'C202', 4, 40, 23.5);                            
                                                                                
INSERT INTO transaction (transaction_id, trans_date, farmer_id, customer_id, grain_id, quantity, price_per_unit) VALUES (1051, TO_DATE('2026-04-26 00:00:00','YYYY-MM-DD HH24:MI:SS'), 'F101', 'C203', 1, 60, 26.5);                            
                                                                                
INSERT INTO transaction (transaction_id, trans_date, farmer_id, customer_id, grain_id, quantity, price_per_unit) VALUES (1052, TO_DATE('2026-04-26 00:00:00','YYYY-MM-DD HH24:MI:SS'), 'F102', 'C204', 2, 45, 30);                              
                                                                                
INSERT INTO transaction (transaction_id, trans_date, farmer_id, customer_id, grain_id, quantity, price_per_unit) VALUES (1053, TO_DATE('2026-04-27 00:00:00','YYYY-MM-DD HH24:MI:SS'), 'F103', 'C205', 3, 75, 20);                              
                                                                                
INSERT INTO transaction (transaction_id, trans_date, farmer_id, customer_id, grain_id, quantity, price_per_unit) VALUES (1054, TO_DATE('2026-04-27 00:00:00','YYYY-MM-DD HH24:MI:SS'), 'F104', 'C206', 4, 35, 22.5);                            
                                                             
INSERT INTO transaction (transaction_id, trans_date, farmer_id, customer_id, grain_id, quantity, price_per_unit) VALUES (1055, TO_DATE('2026-04-28 00:00:00','YYYY-MM-DD HH24:MI:SS'), 'F105', 'C201', 1, 65, 27);                              
                                                                                
INSERT INTO transaction (transaction_id, trans_date, farmer_id, customer_id, grain_id, quantity, price_per_unit) VALUES (1056, TO_DATE('2026-04-28 00:00:00','YYYY-MM-DD HH24:MI:SS'), 'F101', 'C202', 2, 50, 31);                              
                                                                                
INSERT INTO transaction (transaction_id, trans_date, farmer_id, customer_id, grain_id, quantity, price_per_unit) VALUES (1057, TO_DATE('2026-04-29 00:00:00','YYYY-MM-DD HH24:MI:SS'), 'F102', 'C203', 3, 70, 21);                              

--                                                                                
INSERT INTO transaction (transaction_id, trans_date, farmer_id, customer_id, grain_id, quantity, price_per_unit) VALUES (1058, TO_DATE('2026-04-29 00:00:00','YYYY-MM-DD HH24:MI:SS'), 'F103', 'C204', 4, 30, 23);                              
                                                                                
INSERT INTO transaction (transaction_id, trans_date, farmer_id, customer_id, grain_id, quantity, price_per_unit) VALUES (1059, TO_DATE('2026-04-30 00:00:00','YYYY-MM-DD HH24:MI:SS'), 'F104', 'C205', 1, 80, 28.5);                            
                                                                                
INSERT INTO transaction (transaction_id, trans_date, farmer_id, customer_id, grain_id, quantity, price_per_unit) VALUES (1060, TO_DATE('2026-04-30 00:00:00','YYYY-MM-DD HH24:MI:SS'), 'F105', 'C206', 2, 60, 30);                              
                                                                                
INSERT INTO transaction (transaction_id, trans_date, farmer_id, customer_id, grain_id, quantity, price_per_unit) VALUES (1061, TO_DATE('2026-05-01 00:00:00','YYYY-MM-DD HH24:MI:SS'), 'F101', 'C201', 3, 55, 20.5);                            
                                                                                
INSERT INTO transaction (transaction_id, trans_date, farmer_id, customer_id, grain_id, quantity, price_per_unit) VALUES (1062, TO_DATE('2026-05-01 00:00:00','YYYY-MM-DD HH24:MI:SS'), 'F102', 'C202', 4, 35, 22);                              
                                                                                
INSERT INTO transaction (transaction_id, trans_date, farmer_id, customer_id, grain_id, quantity, price_per_unit) VALUES (1063, TO_DATE('2026-05-02 00:00:00','YYYY-MM-DD HH24:MI:SS'), 'F103', 'C203', 1, 70, 26.5);                            
                                                                                
INSERT INTO transaction (transaction_id, trans_date, farmer_id, customer_id, grain_id, quantity, price_per_unit) VALUES (1064, TO_DATE('2026-05-02 00:00:00','YYY-MM-DD HH24:MI:SS'), 'F104', 'C204', 2, 50, 30);                              
                                                                                
INSERT INTO transaction (transaction_id, trans_date, farmer_id, customer_id, grain_id, quantity, price_per_unit) VALUES (1065, TO_DATE('2026-05-03 00:00:00','YYYY-MM-DD HH24:MI:SS'), 'F105', 'C205', 3, 65, 21);                              
                                                                                
INSERT INTO transaction (transaction_id, trans_date, farmer_id, customer_id, grain_id, quantity, price_per_unit) VALUES (1066, TO_DATE('2026-05-03 00:00:00','YYYY-MM-DD HH24:MI:SS'), 'F101', 'C206', 4, 40, 23);                              
                                                                                
INSERT INTO transaction (transaction_id, trans_date, farmer_id, customer_id, grain_id, quantity, price_per_unit) VALUES (1067, TO_DATE('2026-05-04 00:00:00','YYYY-MM-DD HH24:MI:SS'), 'F102', 'C201', 1, 80, 28);                              
                                                                                
INSERT INTO transaction (transaction_id, trans_date, farmer_id, customer_id, grain_id, quantity, price_per_unit) VALUES (1068, TO_DATE('2026-05-04 00:00:00','YYYY-MM-DD HH24:MI:SS'), 'F103', 'C202', 2, 60, 31);                              
                                                                                
INSERT INTO transaction (transaction_id, trans_date, farmer_id, customer_id, grain_id, quantity, price_per_unit) VALUES (1069, TO_DATE('2026-05-05 00:00:00','YYYY-MM-DD HH24:MI:SS'), 'F104', 'C203', 3, 75, 20);                              
                                                                                
INSERT INTO transaction (transaction_id, trans_date, farmer_id, customer_id, grain_id, quantity, price_per_unit) VALUES (1070, TO_DATE('2026-05-05 00:00:00','YYYY-MM-DD HH24:MI:SS'), 'F105', 'C204', 4, 30, 22.5);                            
                                                                                
INSERT INTO transaction (transaction_id, trans_date, farmer_id, customer_id, grain_id, quantity, price_per_unit) VALUES (1071, TO_DATE('2026-05-06 00:00:00','YYYY-MM-DD HH24:MI:SS'), 'F101', 'C205', 1, 65, 27);                              
                                                                                
INSERT INTO transaction (transaction_id, trans_date, farmer_id, customer_id, grain_id, quantity, price_per_unit) VALUES (1072, TO_DATE('2026-05-06 00:00:00','YYYY-MM-DD HH24:MI:SS'), 'F102', 'C206', 2, 45, 30.5);                            
                                                                                
INSERT INTO transaction (transaction_id, trans_date, farmer_id, customer_id, grain_id, quantity, price_per_unit) VALUES (1073, TO_DATE('2026-05-07 00:00:00','YYYY-MM-DD HH24:MI:SS'), 'F103', 'C201', 3, 70, 21.5);                            
                                                                                
INSERT INTO transaction (transaction_id, trans_date, farmer_id, customer_id, grain_id, quantity, price_per_unit) VALUES (1074, TO_DATE('2026-05-07 00:00:00','YYYY-MM-DD HH24:MI:SS'), 'F104', 'C202', 4, 35, 23);                              
                                                                                
INSERT INTO transaction (transaction_id, trans_date, farmer_id, customer_id, grain_id, quantity, price_per_unit) VALUES (1075, TO_DATE('2026-05-08 00:00:00','YYYY-MM-DD HH24:MI:SS'), 'F105', 'C203', 1, 75, 28.5);                            
                                                                                
INSERT INTO transaction (transaction_id, trans_date, farmer_id, customer_id, grain_id, quantity, price_per_unit) VALUES (1076, TO_DATE('2026-05-08 00:00:00','YYYY-MM-DD HH24:MI:SS'), 'F101', 'C204', 2, 50, 30);                              
                                                                                

INSERT INTO transaction (transaction_id, trans_date, farmer_id, customer_id, grain_id, quantity, price_per_unit) VALUES (1077, TO_DATE('2026-05-09 00:00:00','YYYY-MM-DD HH24:MI:SS'), 'F102', 'C205', 3, 60, 20.5);                            
                                                                                
INSERT INTO transaction (transaction_id, trans_date, farmer_id, customer_id, grain_id, quantity, price_per_unit) VALUES (1078, TO_DATE('2026-05-09 00:00:00','YYYY-MM-DD HH24:MI:SS'), 'F103', 'C206', 4, 40, 22);                              
                                                                                
INSERT INTO transaction (transaction_id, trans_date, farmer_id, customer_id, grain_id, quantity, price_per_unit) VALUES (1079, TO_DATE('2026-05-10 00:00:00','YYYY-MM-DD HH24:MI:SS'), 'F104', 'C201', 1, 80, 27.5);                            

                                                                                
INSERT INTO transaction (transaction_id, trans_date, farmer_id, customer_id, grain_id, quantity, price_per_unit) VALUES (1080, TO_DATE('2026-05-10 00:00:00','YYYY-MM-DD HH24:MI:SS'), 'F105', 'C202', 2, 55, 31);                              
                                                                                
INSERT INTO transaction (transaction_id, trans_date, farmer_id, customer_id, grain_id, quantity, price_per_unit) VALUES (1081, TO_DATE('2026-05-11 00:00:00','YYYY-MM-DD HH24:MI:SS'), 'F101', 'C203', 3, 65, 21);                              
                                                                                
INSERT INTO transaction (transaction_id, trans_date, farmer_id, customer_id, grain_id, quantity, price_per_unit) VALUES (1082, TO_DATE('2026-05-11 00:00:00','YYYY-MM-DD HH24:MI:SS'), 'F102', 'C204', 4, 30, 23);                              
                                                                                
INSERT INTO transaction (transaction_id, trans_date, farmer_id, customer_id, grain_id, quantity, price_per_unit) VALUES (1083, TO_DATE('2026-05-12 00:00:00','YYYY-MM-DD HH24:MI:SS'), 'F103', 'C205', 1, 70, 26);                              
                                                                                
INSERT INTO transaction (transaction_id, trans_date, farmer_id, customer_id, grain_id, quantity, price_per_unit) VALUES (1084, TO_DATE('2026-05-12 00:00:00','YYYY-MM-DD HH24:MI:SS'), 'F104', 'C206', 2, 45, 30.5);                            
                                                                                
INSERT INTO transaction (transaction_id, trans_date, farmer_id, customer_id, grain_id, quantity, price_per_unit) VALUES (1085, TO_DATE('2026-05-13 00:00:00','YYYY-MM-DD HH24:MI:SS'), 'F105', 'C201', 3, 75, 20);                              
                                                                                
INSERT INTO transaction (transaction_id, trans_date, farmer_id, customer_id, grain_id, quantity, price_per_unit) VALUES (1086, TO_DATE('2026-05-13 00:00:00','YYYY-MM-DD HH24:MI:SS'), 'F101', 'C202', 4, 35, 22.5);                            
                                                                                
INSERT INTO transaction (transaction_id, trans_date, farmer_id, customer_id, grain_id, quantity, price_per_unit) VALUES (1087, TO_DATE('2026-05-14 00:00:00','YYYY-MM-DD HH24:MI:SS'), 'F102', 'C203', 1, 80, 28);                              
                                                                                

INSERT INTO transaction (transaction_id, trans_date, farmer_id, customer_id, grain_id, quantity, price_per_unit) VALUES (1088, TO_DATE('2026-05-14 00:00:00','YYYY-MM-DD HH24:MI:SS'), 'F103', 'C204', 2, 50, 30);                              
                                                                                
INSERT INTO transaction (transaction_id, trans_date, farmer_id, customer_id, grain_id, quantity, price_per_unit) VALUES (1089, TO_DATE('2026-05-15 00:00:00','YYYY-MM-DD HH24:MI:SS'), 'F104', 'C205', 3, 65, 21.5);                            
                                                                                
INSERT INTO transaction (transaction_id, trans_date, farmer_id, customer_id, grain_id, quantity, price_per_unit) VALUES (1090, TO_DATE('2026-05-15 00:00:00','YYYY-MM-DD HH24:MI:SS'), 'F105', 'C206', 4, 45, 22);                              
                                                                                
INSERT INTO transaction (transaction_id, trans_date, farmer_id, customer_id, grain_id, quantity, price_per_unit) VALUES (1091, TO_DATE('2026-05-16 00:00:00','YYYY-MM-DD HH24:MI:SS'), 'F101', 'C201', 1, 55, 25.5);                            
                                                                                
INSERT INTO transaction (transaction_id, trans_date, farmer_id, customer_id, grain_id, quantity, price_per_unit) VALUES (1092, TO_DATE('2026-05-16 00:00:00','YYYY-MM-DD HH24:MI:SS'), 'F102', 'C202', 2, 60, 30.5);                            
                                                                                
INSERT INTO transaction (transaction_id, trans_date, farmer_id, customer_id, grain_id, quantity, price_per_unit) VALUES (1093, TO_DATE('2026-05-17 00:00:00','YYYY-MM-DD HH24:MI:SS'), 'F103', 'C203', 3, 75, 19.5);                            
                                                                                
INSERT INTO transaction (transaction_id, trans_date, farmer_id, customer_id, grain_id, quantity, price_per_unit) VALUES (1094, TO_DATE('2026-05-17 00:00:00','YYYY-MM-DD HH24:MI:SS'), 'F104', 'C204', 4, 40, 23.5);                            
                                                                                
INSERT INTO transaction (transaction_id, trans_date, farmer_id, customer_id, grain_id, quantity, price_per_unit) VALUES (1095, TO_DATE('2026-05-18 00:00:00','YYYY-MM-DD HH24:MI:SS'), 'F105', 'C205', 1, 65, 27);                              
                                                                                
INSERT INTO transaction (transaction_id, trans_date, farmer_id, customer_id, grain_id, quantity, price_per_unit) VALUES (1096, TO_DATE('2026-05-18 00:00:00','YYYY-MM-DD HH24:MI:SS'), 'F101', 'C206', 2, 35, 29.5);                            
                                                                                
INSERT INTO transaction (transaction_id, trans_date, farmer_id, customer_id, grain_id, quantity, price_per_unit) VALUES (1097, TO_DATE('2026-05-19 00:00:00','YYYY-MM-DD HH24:MI:SS'), 'F102', 'C201', 3, 80, 20);                              
                                                                                
INSERT INTO transaction (transaction_id, trans_date, farmer_id, customer_id, grain_id, quantity, price_per_unit) VALUES (1098, TO_DATE('2026-05-19 00:00:00','YYYY-MM-DD HH24:MI:SS'), 'F103', 'C202', 4, 30, 22.5);                            
                                                                                
INSERT INTO transaction (transaction_id, trans_date, farmer_id, customer_id, grain_id, quantity, price_per_unit) VALUES (1099, TO_DATE('2026-05-20 00:00:00','YYYY-MM-DD HH24:MI:SS'), 'F104', 'C203', 1, 70, 26);                              
                                                                                
INSERT INTO transaction (transaction_id, trans_date, farmer_id, customer_id, grain_id, quantity, price_per_unit) VALUES (1100, TO_DATE('2026-05-20 00:00:00','YYYY-MM-DD HH24:MI:SS'), 'F105', 'C204', 2, 50, 31);                              
                                                                                


