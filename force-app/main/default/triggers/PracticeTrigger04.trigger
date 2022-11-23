trigger PracticeTrigger04 on Case (before insert , Before Update) 
{
    if (Trigger.isBefore && (Trigger.isInsert || Trigger.isUpdate)) 
    {
       for(Case cs : Trigger.new) 
       {
            if(Cs.AccountId ==null )
            {
                cs.AccountId.adderror('Please Mention Respective Case Orginated Account');
            }
            else if (cs.ContactId == Null )
            {
                Cs.ContactId.adderror('Please Mention Respective Contact Details');
            }
       }
    }
}