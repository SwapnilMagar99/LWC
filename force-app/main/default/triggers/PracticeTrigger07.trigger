trigger PracticeTrigger07 on Account (After Update) 
{
    if (Trigger.isAfter && Trigger.isUpdate) 
    {
       List<Contact> listName = [Select id, firstname, lastname, phone, fax, accountid,
                                    mailingStreet, mailingCity, mailingState, mailingCountry, mailingPostalCode
                                            from Contact 
                                                Where accountid =: Trigger.newmap.keyset()];

        
        if(listname != null)                                           
        {
            for(Contact Con : listName)
            {
                Account acc = Trigger.newmap.get(Con.accountid);

                //Con.firstname = acc.firstname;
                //con.lastname = acc.lastname;
                Con.phone = acc.phone;
                Con.fax = Acc.fax;
            }
        }
    }
}