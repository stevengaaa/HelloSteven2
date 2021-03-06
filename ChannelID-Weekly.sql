use ActiveRewards;
go
-- UPDATE the dates for the relevant week
declare @BeginDate datetime = '20180805';
declare @NextWeekDate datetime = dateadd(week, 1, @BeginDate);

-- Detail
  select cgc.Id, cgc.CardCustomerGroupID, cgc.ChannelID, cgc.ChannelType, cgc.DateCreated, m.MerchantID, m.Name as MerchantName
  from CustomerGroupChannel cgc
  join CardCustomer cc on cgc.CardCustomerGroupID = cc.CardCustomerGroupID
  join MerchantClass mc on cc.MerchantClassID = mc.MerchantClassID
  join Merchant m on mc.MerchantID = m.MerchantID
  where m.MerchantGroupID = 22 
  and cgc.DateCreated >= @BeginDate 
  and cgc.DateCreated  < @NextWeekDate
  order by DateCreated;

  -- Count by Store
  select m.Name MerchantName, Count(*) NewForDateRange
  from CustomerGroupChannel cgc
  join CardCustomer cc on cgc.CardCustomerGroupID = cc.CardCustomerGroupID
  join MerchantClass mc on cc.MerchantClassID = mc.MerchantClassID
  join Merchant m on mc.MerchantID = m.MerchantID
  where m.MerchantGroupID = 22 
  and cgc.DateCreated >= @BeginDate 
  and cgc.DateCreated  < @NextWeekDate
  group by m.Name




