public class RelatedAccContCaseClass 
{ 
    Public static void relatedclassmethod()
    {	
        // list collection for Contact
        List<Contact> lstcontact = new List<Contact>();
        
        // list collection for Case
        List<Case> lstcase= new List<Case>();
        
        Account acc = new Account();
        
        acc.name = 'If Else Trail Account';
        acc.Active__c = 'Yes';
        acc.AnnualRevenue = 450000;
        
        if(acc != null)
        {
            insert acc;
            
            for(integer counter=1;counter<=5;counter++)
            {
                Contact cont = new Contact();
                
                cont.firstname = 'Chandu';
                cont.LastName = 'Master '+ counter;
                cont.Email = 'chandumaster'+counter+'@gmail.com';
                cont.AccountId = acc.Id;
                
                lstcontact.add(cont);
            }                
                insert lstcontact;
                
                if(!lstcontact.isEmpty())
                {   
                    system.debug('The Contact Records are created Successfully '+ lstcontact.size());
                }
                
                for(integer i=1;i<=10;i++)
                {
                    Case cs = new Case();
                    
                    cs.Subject = 'Case of If else Issue  ' + i;
                    cs.Status = 'New';
                    if(i<=5)
                    {
                        cs.Origin = 'Phone';
                    	cs.Type = 'Mechanical';
                    }
                    else 
                    {
                        cs.Origin = 'web';
                    	cs.Type = 'Electrical';
                    }
                    cs.Priority = 'High';
                   cs.AccountId = acc.Id;
                    
                    lstcase.add(cs);
                } 
                    insert lstcase;
                    
                    if(!lstcase.isEmpty())
                    {             
                        system.debug('The Case records are Created Successfully');
                    }             
              }
        
    }
    
    Public static void relatedtask()
    {
        Account acc = new Account();
        
        acc.name = 'Related task';
        acc.Active__c = 'Yes';
        acc.AnnualRevenue = 450000;
        
        if(acc != null)
        {
            insert acc;
            
            task ts = new Task();
            ts.Subject = 'Related Task for Coding';
            ts.Status = 'Not Started';
            ts.Priority = 'High';
            ts.WhatId = acc.id;
            
            insert ts;
            
        }
    }
    
    Public static void deleterecords()
    {
        delete[select id , firstname from Contact where firstname like : 'practice%'];
    }
}