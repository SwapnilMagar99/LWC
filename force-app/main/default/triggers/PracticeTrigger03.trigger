trigger PracticeTrigger03 on Account (before delete) 
{
    if (Trigger.isBefore && Trigger.isdelete) 
    {
       for(Account acc : Trigger.old) 
       {
         if(acc.active__C == 'Yes')
         {
            acc.active__C.adderror('Active Account Can Not be Deleted..!!! Contact to your Admin');
         }
       }
    }
}