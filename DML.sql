use BakmiWM

insert into MsPosition values
('SP001','Chairman'),
('SP002','Director'),
('SP003','Assistant Manager'),
('SP004','Secretary'),
('SP005','Treasurer'),
('SP006','Accountant'),
('SP007','Cashier'),
('SP008','Chef'),
('SP009','Waiter'),
('SP010','DishWasher');

select * from MsPosition

insert into MsStaff values
('SF001','SP001','Andi Remi','Male','1995-10-10','083814142326','AndiJaya23@gmail.com','Jln. Kemanggisan 2 no. 3',25000000),
('SF002','SP002','Rika Marika','Female','1998-12-11','083812134321','RikaSaputri11@yahoo.com','Jln. Kebahagiaan 5 no. 12',20000000),
('SF003','SP003','Budi Sanjaya','Male','2000-01-03','083311192032','BudiPrakasa12@gmail.com','Jln. Teluk gong 4 no. 23',18000000),
('SF004','SP004','Andra Simanjuntak','Male','1996-08-27','081793124353','AndraSaputra@gmail.com','Jln. Kebun Jeruk 12 no. 1',15000000),
('SF005','SP005','Joko Pramono','Male','1998-07-12','083312124256','JokoPilu10@gmail.com','Jln. Kemanggisan 4 no. 12',15000000),
('SF006','SP006','Asep Supriadi','Male','1993-10-13','081896784526','Asep132@gmail.com','Jln. Pegangsaan 23 no. 1',14000000),
('SF007','SP007','Udin Suepudin','Male','1999-05-06','081243907653','Udin13452@yahoo.com','Jln. Kemanggisan 3 no. 10',12500000),
('SF008','SP007','Miranda sulaiman','Female','1998-09-17','081908731231','Mirandas@gmail.com','Jln. Kebahagiaan lama no.2',15000000),
('SF009','SP008','Yogi Hendrawan','Male','1997-12-09','083247839210','YogiPrambudi43@gmail.com','Jln. Mangga 2 no. 21',8000000),
('SF010','SP009','Tika Mariyam','Female','2000-12-21','083802346172','Tika4123@yahoo.com','Jln. Kemanggisan 3 no. 12',7000000),
('SF011','SP010','Andini Hesti','Female','1997-03-18','083813908765','AndiniPutri06@gmail.com','Jln. Kebun Jeruk 1 no. 1',6000000);


select * from MsStaff

insert into MsCategory values
('MC001','Food'),
('MC002','Dessert'),
('MC003','Beverage'),
('MC004','Topping');

select * from MsCategory

insert into MsMenu values
('ME001','MC001','Bakmi Ayam',20000),
('ME002','MC001','Kwetiau Ayam',20000),
('ME003','MC001','Bihun Ayam',20000),
('ME004','MC001','Bakso Ayam',20000),
('ME005','MC002','Ice Cream Cokelat',10000),
('ME006','MC002','Ice Cream Vanilla',10000),
('ME007','MC003','Es teh manis',5000),
('ME008','MC003','Es teh tawar',3000),
('ME009','MC003','Teh hangat',2000),
('ME010','MC004','Pangsit Goreng',4000);

select * from MsMenu

insert into MsCustomer values
('CU001','Joni Roy','Male','081342133231','joni123@gmail.com','jln. pluit raya no 2a'),
('CU002','Bara Simatupang','Male','081339398761','Barara32@gmail.com','jln. krendang raya no 20'),
('CU003','Ben Jaya','Male','081312123979','Bena@yahoo.com','jln. Muara karang 3 no 1'),
('CU004','Ryan Albery','Male','089712123131','Ryan433@gmail.com','jln. Kebun jeruk 3 no 18'),
('CU005','Roy Raga','Male','081349491765','Roysubakti@gmail.com','jln. Mangga Dua no 12'),
('CU006','Chika Rahmadi','Female','087856457329','Chikamarika@yahoo.com','jln. Mangga Lima no 13'),
('CU007','Santi Soliya','Female','088359684784','santi098@gmail.com','jln. Jemabatan lima no 1'),
('CU008','Bobi Martines','Male','081312314892','Bobi321@gmail.com','jln. Jembatan Dua no 18'),
('CU009','Bryan Tantowi','Male','083875671298','BryanF1@gmail.com','jln. Anggur no 9B'),
('CU010','Silvie Asmira','Female','081597617939','Silvy56@gmail.com','jln. Apple 2 no 10');

select * from MsCustomer

insert into MsSouvenir values
('SO001','BakmiWM Keychain',5000,7000),
('SO002','Botol Minum',40000,45000),
('SO003','Bolpoin',2000,3000),
('SO004','Buku Note',10000,12000),
('SO005','Tempat Pensil',15000,20000),
('SO006','Piring BakmiWM',20000,25000),
('SO007','Baju BakmiWM',50000,55000),
('SO008','BakmiWM Figure',40000,50000),
('SO009','Boneka BakmiWM',35000,40000),
('SO010','Sticker BakmiWM',2000,3000);

select * from MsSouvenir

insert into MsMenuTransaction values
('MT001','SF007','CU001','2021-12-01'),
('MT002','SF007','CU002','2021-12-01'),
('MT003','SF007','CU003','2021-12-02'),
('MT004','SF007','CU004','2021-12-02'),
('MT005','SF007','CU005','2021-12-02'),
('MT006','SF007','CU006','2021-12-02'),
('MT007','SF007','CU007','2021-12-03'),
('MT008','SF007','CU008','2021-12-04'),
('MT009','SF007','CU009','2021-12-04'),
('MT010','SF008','CU010','2021-12-08'),
('MT011','SF008','CU001','2021-12-08'),
('MT012','SF007','CU001','2021-12-11'),
('MT013','SF008','CU004','2021-12-12'),
('MT014','SF008','CU003','2021-12-14'),
('MT015','SF007','CU008','2021-12-14'),
('MT016','SF007','CU005','2021-12-16'),
('MT017','SF008','CU006','2021-12-16'),
('MT018','SF008','CU003','2021-12-19'),
('MT019','SF007','CU002','2021-12-22');

select * from MsMenuTransaction

insert into MsMenuTransactionDetail values
('MT001','ME001',2),
('MT001','ME002',3),
('MT001','ME007',3),
('MT001','ME008',2),
('MT002','ME002',2),
('MT002','ME003',2),
('MT002','ME007',4),
('MT003','ME002',2),
('MT003','ME003',2),
('MT003','ME007',4),
('MT003','ME009',2),
('MT004','ME001',2),
('MT004','ME007',1),
('MT005','ME001',2),
('MT005','ME008',2),
('MT006','ME002',1),
('MT006','ME004',1),
('MT007','ME002',2),
('MT008','ME001',4),
('MT008','ME003',3),
('MT009','ME002',2),
('MT010','ME002',2),
('MT010','ME006',3),
('MT011','ME003',3),
('MT012','ME001',1),
('MT013','ME002',2),
('MT014','ME004',1),
('MT015','ME001',2),
('MT016','ME002',8),
('MT016','ME003',10),
('MT017','ME001',8),
('MT018','ME005',9),
('MT018','ME001',8),
('MT019','ME005',8),
('MT019','ME008',9);

select * from MsMenuTransactionDetail

insert into MsSouvenirTransaction values
('ST001','SF007','CU001','2021-12-01'),
('ST002','SF007','CU002','2021-12-01'),
('ST003','SF008','CU003','2021-12-02'),
('ST004','SF008','CU004','2021-12-02'),
('ST005','SF007','CU005','2021-12-03'),
('ST006','SF007','CU006','2021-12-06'),
('ST007','SF007','CU007','2021-12-06'),
('ST008','SF008','CU008','2021-12-08'),
('ST009','SF008','CU001','2021-12-08'),
('ST010','SF007','CU005','2021-12-10'),
('ST011','SF008','CU009','2021-12-11'),
('ST012','SF007','CU010','2021-12-12'),
('ST013','SF008','CU002','2021-12-12'),
('ST014','SF007','CU004','2021-12-14'),
('ST015','SF008','CU007','2021-12-14');

select * from MsSouvenirTransaction

insert into MsSouvenirTransactionDetail values
('ST001','SO009',1),
('ST001','SO002',3),
('ST002','SO009',4),
('ST002','SO004',1),
('ST003','SO001',6),
('ST003','SO003',6),
('ST003','SO006',8),
('ST004','SO001',8),
('ST005','SO010',1),
('ST006','SO005',3),
('ST006','SO006',2),
('ST007','SO004',2),
('ST008','SO001',7),
('ST008','SO002',6),
('ST009','SO003',7),
('ST010','SO001',3),
('ST011','SO008',6),
('ST011','SO009',8),
('ST011','SO010',6),
('ST012','SO002',4),
('ST012','SO009',2),
('ST013','SO006',6),
('ST013','SO005',6),
('ST014','SO008',3),
('ST015','SO006',7);

select * from MsSouvenirTransactionDetail