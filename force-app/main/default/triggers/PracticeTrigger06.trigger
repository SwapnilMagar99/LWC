trigger PracticeTrigger06 on Account (before delete) 
{
    if(trigger.isBefore && Trigger.isDelete)
    {
        List<Contact> lstcontact = [Select id ,firstname,lastname , accountId from Contact
                                                    where accountid in : Trigger.oldmap.keyset()];

            if(lstcontact != null)                                                
            {
                for(Contact Con : lstcontact)
                {
                    Con.accountId = null;
                }
                Update lstcontact;
            }
    }
}