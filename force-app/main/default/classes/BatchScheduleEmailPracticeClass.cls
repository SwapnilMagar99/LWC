public class BatchScheduleEmailPracticeClass 
{
	Public static void BatchScheduleEmailPracticemethod(AsyncApexJob jdetails ,String jobName)
    {
        //List<Messaging.SingleEmailMessage> lstemail = new List<Messaging.SingleEmailMessage>();
        
        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
        
        String [] toaddress = new String[]{jdetails.CreatedBy.email ,'magarswapnil9@gmail.com'};
        email.setToAddresses(toaddress);        
        string subject = 'Congratulation ....!!! Your Account Site get Updated.';
        email.setSubject(subject);        
        email.setSenderDisplayName('Update Support Team');
        email.setReplyTo('magar.salesforce9@gmail.com');
        string body = 'Dear User, <br/><br/> '+'Congratulation ....!!! Your Account Site get Updated. <br/>'+
            		  'Batch Job name is:- ' + jobname +' <br/>'+
            		  'Batch job status is :- '+ jdetails.Status + ' <br/>' + 
            		  'Batch job total items are :- '+ jdetails.TotalJobItems +' <br/>' + 
            		  'Batch created by Email ID is :- '+jdetails.CreatedBy.email + ' <br/><br/>' + 
            		  'Regards,  <br/> Swapnil Balasaheb Magar  <br/> Update Suport team ';
        email.setHtmlBody(body);
        
        if(email != null)
        {
            List<Messaging.EmailFileAttachment> lstattach = new  List<Messaging.EmailFileAttachment>();
            
            Messaging.EmailFileAttachment attach = new  Messaging.EmailFileAttachment();
            
            attach.setContentType('Application / pdf');
            attach.setFileName('Update Batch Report');
            attach.body = blob.toPdf(body);
            
            lstattach.add(attach);
            email.setFileAttachments(lstattach);
            
            //lstemail.add(email);
            
            if(email != null)
            {
                messaging.SendEmailResult[] result = Messaging.sendEmail(new Messaging.SingleEmailMessage[]{email});
                
                system.debug('The Email Has been Sent Sucessfully ... !!!' + email);
            }
            
        }
        
    }
}