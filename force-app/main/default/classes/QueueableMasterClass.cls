Global class QueueableMasterClass implements System.Queueable
{
	Global void execute (System.QueueableContext qcontext)
    {
        Account acc = new Account();
        
        acc.name = 'Queue Apex Account';
        insert acc;
        if(acc != null)
        {
            System.debug('The Account is Created :- ' + acc.Name);
            
            id contactid = System.enqueueJob(new QueueableChildClass(acc));
        }
    }
}