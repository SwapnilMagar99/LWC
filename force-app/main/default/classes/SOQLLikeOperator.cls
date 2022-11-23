public class SOQLLikeOperator 
{
	Public static void globalsearch(string searchtext)
    {
        if(searchtext != null && searchtext !='')
        {
            searchtext +='%';
            
            List<Account> lstacc = [Select id ,name, rating, phone, annualrevenue from Account where name like : searchtext];
            
            if(!lstacc.isEmpty())
            {
                system.debug('The Collection of Account is:- ' + lstacc);
            }
        }
    }
}