trigger PraticeTrigger02 on Account (before insert , before Update) 
{
    if(Trigger.isBefore && (Trigger.isInsert || Trigger.isUpdate))
    {
        for(Account acc : Trigger.new)
        {
            switch on acc.industry 
            {
                when  'Banking'
                {
                    acc.annualrevenue = 9000000;
                }
                When 'Finance'
                {
                    acc.annualrevenue = 500000;
                }
                When 'Energy'
                {
                    acc.annualrevenue = 9400000;
                }                
            }
        }
    }
}