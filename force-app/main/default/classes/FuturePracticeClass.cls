public class FuturePracticeClass 
{
	Public static void setupmethod(String usernameid)
    {
        if(Usernameid != null && Usernameid != '')
        {
           User us = [Select id , name , username from User 
                     			Where username =: usernameid];
            if(us != null)
            {
                us.IsActive = false;
                
                update us;
                system.debug('The User is not Active AnyMore... ' + usernameid);
                
                // Create Account Record Also..
                FuturePracticeClass.nonsetupmethod();
            }           
        }
    }
    
    @future()
    Public Static Void nonsetupmethod()
    {
        Account acc = new Account();
        
        acc.Name = 'Future Class Account';
        
        insert acc;
        
        system.debug('The Account is Created Sucessfully... !!!' + acc);
    }
}