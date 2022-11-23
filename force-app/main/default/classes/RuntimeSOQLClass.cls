public class RuntimeSOQLClass 
{
    //1. Write an Apex program, to fetch all the Account Records based on the specified "Industry" at runtime.    
	Public static void question1(string industryname)
    {
        List<Account> acc = [select id , name, rating, phone, industry 
                            				from Account
                            					where industry =: industryname];
        
        if(acc != null )
        {
            System.debug('The '+industryname +' listed Accout is :- ' + acc);
        }
    }
    
    //2. Write an apex program, to fetch all the Lead Records based on the specified Lead Status.
    Public static void question2(string statusname)
    {
        List<Lead> lstlead = [Select id, firstname, lastname, Status, phone, email from lead
                             			where Status =: statusname];
        
        if(!lstlead.isEmpty())
        {
            system.debug('The '+ statusname+' status of lead record is:- '+ lstlead);
        }
    }
    
    //3. Write an apex program, to fetch the User Record based on the Specified User Name.
    Public static void question3(string loginname)
    {
        List<User> lstuser= [Select id, firstname, lastname, email, username, isActive
                                			from User
                            					where username =:loginname and isActive =true];
        
        if(lstuser != null)    
        { system.debug('The Active user detail is:- ' + lstuser); }
    }
    
    //4. Write an apex program, to fetch all the Opportunity Records based on the specified StageName.
    Public static void question4(string stage)
    {
        List<Opportunity> lstOppty = [Select id , name, AccountId, Stagename from Opportunity 
                                      						where Stagename = : stage];
        
        if(!lstoppty.isEmpty())
        {
            system.debug('The Oppty Info is:- '+ lstoppty);
        }
    }
    
    /*
     To Excecution of Class...

        RuntimeSOQLClass.question1('Banking');   
        RuntimeSOQLClass.question2('Working - Contacted');
        RuntimeSOQLClass.question3('devloperpracticeorg@gmail.com');
        RuntimeSOQLClass.question4('Closed Won');
	
	*/


}