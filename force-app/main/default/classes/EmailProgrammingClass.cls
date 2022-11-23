public class EmailProgrammingClass 
{
	Public static void emailmethod()
    {
        List<Messaging.SingleEmailMessage> lstemail= new List<Messaging.SingleEmailMessage>();
        
        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
        
        string [] toaddress =new string[]{ 'magar.salesforce9@gmail.com ',' ketakijadhav123@gmail.com'};
        email.setToAddresses(toaddress);
        
        string subject = 'The Email is send for Session training practice';
        email.setSubject(subject);
        
        email.setReplyTo('SupportERP@gmail.com');
        
        email.setEmailPriority('High');
        
        email.setSenderDisplayName('Practice Email Class');
        
        string emailbody = 'Congratulation For Successfully creation of Email class programmatically <br/><br/>'+
            				'You are to smart no to worry<br/><br/>'+
            				'Go ahead... Try Harder <br/> <br/> '+
            				'<i> Regards, <br/> Swapnil Balasaheb Magar <br/></i>';
        email.setHtmlBody(emailbody);                
        
        if(email != null)
        {
            List<Messaging.EmailFileAttachment> lstattach = new List<Messaging.EmailFileAttachment>();
            
            Messaging.EmailFileAttachment attach = new Messaging.EmailFileAttachment();
            
            attach.setBody(Blob.toPdf(emailbody));
            
            attach.setContentType('application / pdf');
            
            attach.setFileName('Prcatice Email Attach');
            
            lstattach.add(attach);
            
            email.setFileAttachments(lstattach);
            
            lstemail.add(email);
            
            If(!lstemail.isEmpty())
            {
                Messaging.SendEmailResult[] result = Messaging.sendEmail(lstemail);                               
            }            
        }                
    }
}