public class SOQLPRACTICECLASS 
{
    /*
Assignments:
============
1. Write an apex program, to fetch all the Contact Records from the object and represent the records on the Debug Log File.

2. Write an apex program, to fetch all the Opportunity Records from the object and represent on the Debug Log File.

3. Write an apex program, to fetch all the User Records from the object and store them into the "Map Collection" and Display the Records on the Debug Log File.

4. Write an apex program, to fetch all the Position Records from the object and store them to the Map Collection. And represent the records on the Debug Log File. 

*/   
    Public static void question1()
    {
        List<Contact> lstcontact = [select id , firstname, lastname , email, phone from contact];
        
        System.debug('The Size of Contact is :- ' + lstcontact.size());
        system.debug('The Contact Information is :- ' + lstcontact);
    }
    
    Public static void question2()
    {
        List<Opportunity> lstoppty = [select id , name , amount from Opportunity];
        
        System.debug('The Size of Opportunity is :- ' + lstoppty.size());
        system.debug('The Contact Information is :- ' + lstoppty);
    }
    
    Public static void question3()
    {
        Map<id, User> Mapuser = new Map<Id, User>([Select id, name,IsActive, ContactId, CompanyName , Department, 
                                                   ProfileId, Phone from User ]);
        
        System.debug('The Total User in Org is:- ' + mapuser.size());
        
        if(Mapuser != null)
        {
            for(User us : Mapuser.values())
            {
                System.debug('The User Details are :- ' + us);
            }
        }
        
    }
    
    Public static void question4()
    {
        Map<Id, Opportunity> mapoppty = new map<id, Opportunity>([Select id , name , Stagename, AccountId, CloseDate , Amount 
                                                                  from Opportunity 
                                                                  where stagename = 'Closed Won']);
        System.debug('The Total Closed Won Opportunities are :- ' + mapoppty.size());
        
        if(mapoppty != null)
        {
            for(Opportunity oppty : mapoppty.values())
            {
                System.debug('The Oppty Information is:- ' + oppty);
            }
        }
        
        
    }
}