use BakmiWM

/*1---------------------------------------------------------------------------------------------------------------------------------------*/
select 
mc.CustomerID,
CustomerName,
[Total Transaction] = cast(count(MenuTransactionID) + count(SouvenirTransactionID) as varchar) + ' purchase(s)'
from MsCustomer mc
	join MsMenuTransaction mmt
		on mc.CustomerID = mmt.CustomerID
	join MsSouvenirTransaction mst
		on mc.CustomerID = mst.CustomerID
	join MsStaff ms
		on mmt.StaffID = ms.StaffID
where CustomerName like '%e%' and StaffName like '%n'
group by mc.CustomerID,CustomerName

/*2---------------------------------------------------------------------------------------------------------------------------------------*/
select 
mst.SouvenirTransactionID,
ms.StaffID,
mc.CustomerID,
[Total Price] = 'Rp. ' + cast(sum(SellPrice*Quantity) as varchar)
from MsCustomer mc
	join MsSouvenirTransaction mst
		on mc.CustomerID = mst.CustomerID
	join MsStaff ms
		on mst.StaffID = ms.StaffID
	join MsSouvenirTransactionDetail mstd
		on mst.SouvenirTransactionID = mstd.SouvenirTransactionID
	join MsSouvenir mso
		on mstd.SouvenirID = mso.SouvenirID
where len(mc.CustomerName) >= 10 and mso.SellPrice > 35000
group by mst.SouvenirTransactionID,ms.StaffID,mc.CustomerID

/*3---------------------------------------------------------------------------------------------------------------------------------------*/
select 
mmt.MenuTransactionID,
CustomerName,
TransactionDate = CONVERT(varchar, TransactionDate, 105),
[Total Product] = count(MenuID),
[Total Quantity] = sum(MenuQuantity)
from MsCustomer mc
	join MsMenuTransaction mmt
		on mc.CustomerID = mmt.CustomerID
	join MsMenuTransactionDetail mmtd
		on mmt.MenuTransactionID = mmtd.MenuTransactionID
where day(TransactionDate)%2 = 0 and CustomerName like '% %'
group by mmt.MenuTransactionID,CustomerName,TransactionDate

/*4---------------------------------------------------------------------------------------------------------------------------------------*/
select 
mst.SouvenirTransactionID,
[Staff First Name] = left(StaffName, charindex(' ', StaffName) - 1),
[Total Product] = count(SouvenirID),
[Total Quantity] = sum(Quantity)
from MsSouvenirTransaction mst
	join MsStaff ms
		on mst.StaffID = ms.StaffID
	join MsSouvenirTransactionDetail mstd
		on mst.SouvenirTransactionID = mstd.SouvenirTransactionID
where StaffName like '% %' and StaffSalary >= 10000000
group by mst.SouvenirTransactionID,StaffName

/*5---------------------------------------------------------------------------------------------------------------------------------------*/

select
mst.SouvenirTransactionID,
ms.StaffName,
TransactionDate = convert(varchar, TransactionDate, 105),
Salary = 'Rp' + cast((ms.StaffSalary) as varchar)

from MsSouvenirTransaction mst
	join MsSouvenirTransactionDetail mstd
		on mst.SouvenirTransactionID = mstd.SouvenirTransactionID
	join MsStaff ms
		on mst.StaffID = ms.StaffID
	join MsSouvenir mso
		on mstd.SouvenirID = mso.SouvenirID,
		(
			select [average] = avg (StaffSalary)
			from MsStaff
		)as x
where mso.BuyPrice > 10000 and ms.StaffSalary > x.average

/*6---------------------------------------------------------------------------------------------------------------------------------------*/

select
ms.StaffName,
mn.MenuName,
TransactionDate = convert(varchar, TransactionDate, 107),
StaffPhoneNumber = STUFF(StaffPhoneNumber, 1, 1, '+62')

from MsStaff ms
	join MsMenuTransaction mmt
		on mmt.StaffID = ms.StaffID
	join MsMenuTransactionDetail mmtd
		on mmt.MenuTransactionID = mmtd.MenuTransactionID
	join MsMenu mn
		on mmtd.MenuID = mn.MenuID,
		(
			select [average] = AVG(PriceMenu)
			from MsMenu
		)as x
where ms.StaffGender like 'Female' and mn.PriceMenu > x.average

/*7---------------------------------------------------------------------------------------------------------------------------------------*/

select
mst.SouvenirTransactionID,
CustomerName = upper(CustomerName),
[Total Quantity] = cast(sum(Quantity) as varchar)+ ' pc(s)'

from MsSouvenirTransaction mst
	join MsSouvenirTransactionDetail mstd
		on mstd.SouvenirTransactionID = mst.SouvenirTransactionID
	join MsCustomer mc
		on mst.CustomerID = mc.CustomerID,
		(
			select [max quantity] = max(Quantity)
			from MsSouvenirTransactionDetail
		)as x
where cast(right(mst.SouvenirTransactionID, 3) as int) % 2 != 0
group by mst.SouvenirTransactionID, mc.CustomerName, x.[max quantity]
having SUM(mstd.Quantity) > x.[max quantity]

/*8---------------------------------------------------------------------------------------------------------------------------------------*/

select StaffNumber = stuff((ms.StaffID), 1, 2, 'Staff') ,
StaffName,
PositionName,
[Total Quantity] = sum(y.Total1)
	from MsStaff ms
	join MsPosition mp
		on ms.PositionID = mp.PositionID
	join 
	(
		select mmt.MenuTransactionID, StaffID,
		[Total1] = sum(MenuQuantity)
		from MsMenuTransaction mmt
			join MsMenuTransactionDetail mmtd
				on mmt.MenuTransactionID = mmtd.MenuTransactionID,
				(
				select [Min] = min(mmtd.MenuQuantity)
				from MsMenuTransaction mmt
				join MsMenuTransactionDetail mmtd
					on mmt.MenuTransactionID = mmtd.MenuTransactionID
				where day(TransactionDate) between 16 and 25
				)as x
		group by mmt.MenuTransactionID, StaffID, x.[Min]
		having sum(MenuQuantity) <= x.[Min]
	)as y
on ms.StaffID = y.StaffID
group by ms.StaffID, StaffName, PositionName

/*9---------------------------------------------------------------------------------------------------------------------------------------*/
create view [CustomerMenuPurchaseViewer] as
select
mc.CustomerID,
CustomerName,
CustomerEmail,
[Maximum Quantity] = max(MenuQuantity),
[Minimum Quantity] = min(MenuQuantity)
from MsCustomer mc
	join MsMenuTransaction mmt
		on mc.CustomerID = mmt.CustomerID
	join MsMenuTransactionDetail mmtd
		on mmt.MenuTransactionID = mmtd.MenuTransactionID
where cast(right(mc.CustomerID,3) as int)%2 = 0
group by mc.CustomerID,CustomerName,CustomerEmail
having max(MenuQuantity) != min(MenuQuantity)

select * from [CustomerMenuPurchaseViewer]

/*10--------------------------------------------------------------------------------------------------------------------------------------*/
create view [StaffSouvenirSellingViewer] as
select
ms.StaffID,
StaffName,
StaffAddress,
[Total Price] = sum(Quantity * SellPrice)
from MsStaff ms
	join MsSouvenirTransaction mst
		on ms.StaffID = mst.StaffID
	join MsSouvenirTransactionDetail mstd
		on mst.SouvenirTransactionID = mstd.SouvenirTransactionID
	join MsSouvenir mso
		on mstd.SouvenirID = mso.SouvenirID
where StaffAddress like '% % %'
group by ms.StaffID,StaffName,StaffAddress
having min(Quantity) > 5

select * from StaffSouvenirSellingViewer

