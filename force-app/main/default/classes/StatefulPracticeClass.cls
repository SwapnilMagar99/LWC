Global class StatefulPracticeClass implements database.Batchable <Sobject>, database.stateful
{
    Global decimal totalannualrevenue = 0.0;
	Global database.QueryLocator start (database.BatchableContext bcontext)
    {
        id recordid = Schema.SObjectType.Account.getrecordtypeinfosbyname().get('Business Account').getrecordtypeid();
        string soqlquery = 'select id ,name , annualrevenue , RecordType.id from Account where annualrevenue !=null and RecordType.id=:recordid ';
        return database.getQueryLocator(soqlquery);
    }
    Global void execute (database.BatchableContext bcontext , List<Sobject> recordstoretrive)
    {        
        if(recordstoretrive != null)
        {
            for(Sobject obj : recordstoretrive)
            {
                Account acc = (Account)obj;
                
              totalannualrevenue += acc.AnnualRevenue; 
                System.debug('The total annual revenue is :- ' +  totalannualrevenue);
            }                                         
        }
    }
    Global void Finish (database.BatchableContext bcontext)
    {
        AsyncApexJob jdetails = [select id , status , numberoferrors, totaljobitems , jobitemsprocessed, createdby.email
                                 		from AsyncApexjob where id =: bcontext.getJobId()];
        
        BatchStatefulEmailClass.emailmethod(jdetails, 'StatefulPracticeClass',  totalannualrevenue);
        
    }
}