public class MultiCollectionrecords 
{
    Public static void multirecords()
    {
        List<account> lstacc = new List<Account>();
        
        List<Contact> setcont= new List<Contact>();
        
        Set<Contact> setcont1= new Set<Contact>();
        
        List<Case> lstcase= new List<Case>();
        
        For(integer i=1;i<=2;i++)
        {
            Account acc = new Account();
            acc.name = 'Master Multi Account'+ i;            
            lstacc.add(acc);                        
        }
        if(lstacc != null)
        {
            insert lstacc;
            system.debug('The Master Account record is created..' + lstacc);
            /*
             If We use Set Collection here .....

            set<Contact> setcont= new set<Contact>();

            Error Shows as :- "DML requires SObject or SObject list type: Set<Contact>"
            */
            
            for(Account acc1 : lstacc)
            {
                for(integer i=1;i<=5;i++)
                {
                    Contact cont = new Contact();
                    
                    cont.FirstName = 'Multi';
                    cont.LastName = 'Contact ' + i;
                    cont.Phone = '9405965819';
                    cont.email= 'multicontact'+i+'@gmail.com';
                    cont.AccountId = acc1.Id;
                    
                    setcont1.add(cont);
                    setcont.addall(setcont1);
                    
                }
            }
            
            if(!setcont.isEmpty())
            {
                insert setcont;
                system.debug('The Size of Contacts Created is :- + '+ setcont.size());
                system.debug('The Detail of Contact is :- ' + setcont);
            }
            
            for(Account acc2 : lstacc)
            {	
                /*
               		If we use Map right here ... Give Code as below... 
					
					====== > "No OutPut Observed" <===========

                    Map<id, Case> mapcase = new Map<id, case>([select id , subject, priority,AccountId,Status 
                    from case
                    where AccountId =: acc2.Id]);
                    
                    if(mapcase != null)
                    {
                    for(case cs : mapcase.values())
                    {
                    //insert cs;
                    system.debug('The Case created are :- ' + cs);
                    }
                    }
                    */
                For(integer i=1;i<=10;i++)
                {
                    case cs = new Case();
                    
                    cs.subject = 'Trail Case :- ' + i;
                    cs.priority = 'High';
                    cs.Status = 'New';
                    cs.AccountId = acc2.Id;
                    
                    lstcase.add(cs); 
                    system.debug('The case Info of'+ i +':- ' + lstcase);
                }                                
                
            }
            if(lstcase != null)
                {
                    insert lstcase;                    
                }                        
        }                
        
    }
}