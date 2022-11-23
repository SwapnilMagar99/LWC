public class MapListSOQLCollection 
{
	Public static void trailmethod()
    {
        Map<id,Account> mapAccount = new Map<id,Account>([select id, name, phone  from account where industry ='Banking']);
        
        List<Contact> lstcont = [select id, firstname , lastname, accountId from Contact where accountId in : mapAccount.keyset()];
        
        System.debug('The Contact relate to Banking sector is:- '+ lstcont);
    }
}