Global class QueueableChildClass implements System.Queueable
{
	Account accdetails;
    
    Public QueueableChildClass(Account acc)
    {
        accdetails = acc;
    }
    
    Global void execute (System.QueueableContext qcontext)
    {
        Contact cont = new Contact();
        
        cont.FirstName = 'Queue';
        cont.LastName = 'contact';
        cont.AccountId = accdetails.Id; 
        
        insert cont;
        system.debug('The Contact is Created Sucessfully...!!!' + cont);                
    }
}