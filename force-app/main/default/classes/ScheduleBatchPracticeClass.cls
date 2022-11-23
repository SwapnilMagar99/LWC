Global class ScheduleBatchPracticeClass implements System.Schedulable
{
	Global void Execute (System.SchedulableContext scontext)
    {
        BatchSchedulepracticeclass br = new BatchSchedulepracticeclass();
         Database.executeBatch(br,10);     
    }
}