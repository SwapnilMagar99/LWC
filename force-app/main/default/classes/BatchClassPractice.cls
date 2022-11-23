Global with sharing class BatchClassPractice implements Database.Batchable <Sobject>
{
	Global database.QueryLocator start (Database.BatchableContext bcontext)
    {
        //Id recordTypeId = Schema.SObjectType.Account.getRecordTypeInfosByName().get('PersonAccount').getRecordTypeId();
        id recordid = Schema.SObjectType.Account.getrecordtypeinfosbyname().get('Business Account').getrecordtypeid();
        string soqlquery = 'Select id , name , rating , phone, site, RecordType.id  from Account where RecordType.id=:recordid  ';
        return database.getQueryLocator(soqlquery);
    }
    Global void execute (database.BatchableContext bcontext , list<sobject> recordsretrive)
    {
        List<Account> lstacc = new List<Account>();
        if(!recordsretrive.isEmpty())
        {
            for(Sobject obj : recordsretrive)
            {
                Account acc = (Account)obj;
                if(acc.site == null)
                {
                     acc.site = 'Unknown Site';
                }
                                              	                
                lstacc.add(acc);
            }
            if(!lstacc.isEmpty())
            {
                Update lstacc;
                system.debug('The Total records Updated are :- '+ lstacc);
            }
        }
    }
    Global void finish (Database.BatchableContext bcontext)
    {
        AsyncApexjob jdetails = [select id, status, numberoferrors, totaljobItems, jobitemsprocessed, createdby.email
                                 			from AsyncApexjob
                                					where id =: bcontext.getJobId()];
    }
}