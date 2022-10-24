use BakmiWM

insert into MsCustomer values
('CU011','Adi','Male','081765489321','AdiDarmawan@yahoo.com','Jln. Durian 1 no. 23');

insert into MsMenuTransaction values
('MT020','SF007','CU011',GETDATE());

insert into MsMenuTransactionDetail values
('MT020','ME001',2),
('MT020','ME002',2);

insert into MsSouvenirTransaction values
('ST016','SF007','CU011',GETDATE());

insert into MsSouvenirTransactionDetail values
('ST016','SO002',2),
('ST016','SO004',2);