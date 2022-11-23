public with sharing class PracticeClass 
{
    public static void PracticeClassmethod() 
    {
       for(integer i= 1 ;i <= 2 ;i++)
       {
            Account acc = new Account();

            acc.name = 'Trail VS Code 456' + i;

            insert acc;
       
            if(acc != null)
            {
               
                system.debug('The Account records are created :- ' + acc);

                contact con = new contact();

                con.firstname = 'Trail456';
                Con.lastname = 'Contcat';
               

                con.accountid = acc.id;

                if(con != null)
                {
                    insert con;
                    system.debug('The related contacts are created ' + con);
                }

                Case cs = new Case();

                cs.subject = 'Trail Case 456';
                cs.priority = 'High';

                cs.accountid = acc.id;

                insert cs;
                if (Cs != null) 
                {
                    system.debug('The Case is created :-- ' + cs);    
                }
            }
       
        }

    }
}