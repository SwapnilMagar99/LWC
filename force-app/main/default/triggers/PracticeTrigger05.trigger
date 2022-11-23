trigger PracticeTrigger05 on Contact (before insert , before Update) 
{
    if(Trigger.isBefore && (Trigger.isinsert || Trigger.iSUpdate))
    {
        for(Contact con : Trigger.new)
        {
            integer lstcontact = [Select count() from Contact where firstname =: Con.firstname and lastname =: con.lastname];

            if(lstcontact > 0)
            {
                con.adderror('Duplicate Contact Name Found..!!! Please Recheck Records');
            }
        }
    }
}