Global class BatchSchedulepracticeclass implements Database.Batchable <Sobject>
{
	Global database.QueryLocator start (database.BatchableContext bcontext)       
    {
        id businessid = Schema.SObjectType.Account.getrecordtypeinfosbyname().get('Business Account').getrecordtypeid();
        id personId = Schema.SObjectType.Account.getrecordtypeinfosbyname().get('Person Account').getrecordtypeId();
        string soqlquery = 'Select id , name, Active__c ,Site from Account where RecordType.id =: businessid ';
        return database.getQueryLocator(soqlquery);
    }   
   Global void execute (database.BatchableContext bcontext , list<sobject> recordsretrive)
    {
        List<Account> lstacc = new List<Account>();
        if(recordsretrive != null)
        {
            for(Sobject obj : recordsretrive)
            {
                Account acc = (Account)obj;
               
                if(Acc.Active__c =='Yes')
                {
                    acc.Site = 'Active Site';
                }                                
                lstacc.add(acc);
            }
            if(!lstacc.isEmpty())
            {
                Update lstacc;
                System.debug('The Account record is Updated :- ' + lstacc.size());
                System.debug('The Account record is Updated :- ' + lstacc);
            }
        }
    }
    Global void finish (database.BatchableContext bcontext)
    {
        AsyncApexJob jdetails = [Select id, status, numberoferrors , totaljobitems , jobitemsprocessed, createdby.email from AsyncApexJob 
                                			where id =: bcontext.getJobId()];
             
        BatchScheduleEmailPracticeClass.BatchScheduleEmailPracticemethod(jdetails, 'BatchSchedulepracticeclass');
        System.debug('The Email Has Been Sent to Respective Emails...!!!');
    }
}