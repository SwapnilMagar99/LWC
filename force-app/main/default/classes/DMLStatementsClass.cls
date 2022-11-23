public class DMLStatementsClass 
{
    Public static void databasemethod()
    {
        List<Account> lstacc = new List<Account>();
        
        
        For(integer i = 1;i<=10;i++)
        {   
            Account acc = new Account();
            //acc.name = 'DML Statements Account'+ i;
            acc.phone = '950482192'; 
            lstacc.add(acc);
        }
        if(lstacc != null )
        {           
            Database.SaveResult [] results = Database.insert(lstacc,false);
            
            for(Database.SaveResult res : results)
            {
                if(res.isSuccess())
                {
                    System.debug('The Records get created Successfully');
                    System.debug('The Record Id is :- '+ res.getId());
                }
                else
                {
                    Database.Error [] err = res.geterrors();
                    for(database.Error er : err)
                    {
                        System.debug('The Error status is:- ' + er.getstatuscode());
                        System.debug('The Error status is:- ' + er.getmessage());
                        System.debug('The Error status is:- ' + er.getfields());
                    }
                }
            }
        }
        
    }
    
    Public static void updatemethod()
    {
        List<Account> lstacc = [select id , name, Active__c, type from Account where type = 'Prospect'];
        
        if(lstacc != null)
        {
            for(Account acc : lstacc)
            {
                acc.Type = 'Other';          
            }
            
            Database.SaveResult [] results = Database.update(lstacc, false);
            
            for(Database.SaveResult res : results)
            {
                if(res.isSuccess())
                {
                    System.debug('The Records Updates Successfully');
                    System.debug('The Record id is :- ' + res.getId());
                }
                else
                {
                    Database.Error[] err = res.geterrors();
                   For(Database.Error er : err)
                    {
                        System.debug('The Status code is :- ' + er.getStatusCode());
                        system.debug('The Message of error :- ' + er.getMessage());
                        System.debug('The Error field name is :-' + er.getFields());
                    }
                    
                }
            }
            
        }
    }
    
    Public static void deletemethod(string deletechar)
    {
        deletechar += '%';
        delete [select id , name from account where name like : deletechar];
    }
    
    Public static void undeletemethod(string undeletechar)
    {
        undeletechar += '%';
        Undelete  [select id ,name , isdeleted from account where name like : undeletechar all rows];
    }
    
    Public static void mergemethod()
    {
        Account lstacc = [select id , name from account where name like'DML Statements Account8' limit 1];
        
        Account sourceacc = [select id, name from account where name like 'DML Statements Account1' limit 1];
        
        merge lstacc sourceacc;                                                                                                                                                                                                                                                                                                
    }
}