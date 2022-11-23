public class BatchStatefulEmailClass 
{
	Public static void emailmethod(AsyncApexJob jdetails, string jobName, Decimal revenueAmount)
    {
        List<Messaging.SingleEmailMessage> lstemail = new List<Messaging.SingleEmailMessage>();
        
        List<Messaging.EmailFileAttachment> lstattach = new  List<Messaging.EmailFileAttachment>();
        
        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
        
        string[] toaddress = new String[]{ jdetails.CreatedBy.email };
        email.setToAddresses(toaddress);
        
        email.setSenderDisplayName('Stateful Email Practice');
        
        //email.setEmailPriority('Medium');
        
        email.setInReplyTo('SupportERP999@gmail.com');
        
        email.setSubject('Congratualations....!!! Your email has been send Successfully');
        
        String Subject = 'Congratualations....!!! Your email has been send Successfully<br/><br/>'+
            			'Batch Job name is :- ' + jobname +'<br/><br/>'+
            			'The Total annualRevenue is :- ' + revenueAmount+'<br/><br/>'+
            			'<i><b>Regards <br/> Swapnil Balasaheb Magar</b></i>';
        email.setHtmlBody(subject);
        
        if(email != null)
        {
            Messaging.EmailFileAttachment attach = new  Messaging.EmailFileAttachment();
            
            attach.body = blob.toPdf(subject);
            
            attach.setContentType('Application / Pdf');
            
            attach.setFileName('Stateful Email File');
            
            attach.setInline(true);
            
            lstattach.add(attach);
            
            email.setFileAttachments(lstattach);
            
            //lstemail.add(email);
            if(email != null)
            {
                Messaging.SendEmailResult[] results = Messaging.sendEmail(new messaging.SingleEmailMessage[]{email});
            }
        }
    
    }
}