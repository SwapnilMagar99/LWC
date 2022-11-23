public class InvokeClassPractice 
{
    @invocablemethod (label = 'Practice Invoke Class' Description = 'Practice invoke description')
	Public Static void invokemethod(List<Account> lstacc)       
    {
        if(!lstacc.isEmpty())
        {
            EmailProgrammingClass.emailmethod();
            
            system.debug('The email is send to Account Corresponding person');
        }
    }
}