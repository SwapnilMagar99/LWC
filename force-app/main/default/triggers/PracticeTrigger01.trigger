trigger PracticeTrigger01 on AccounT (before insert, before update) 
{
    if (Trigger.isBefore && (Trigger.isInsert || Trigger.isUpdate)) 
    {
       for(Account acc : Trigger.new) 
       {
            if(Acc.industry == null || Acc.industry == '')
            {
                acc.industry.adderror('Please fill the Industry Field in It ... Before Saving');
            }
            else if (Acc.type == null || acc.type =='')
            {
                acc.adderror('Please Fill Account Type Before Saving');
            }
       }       
    }
}