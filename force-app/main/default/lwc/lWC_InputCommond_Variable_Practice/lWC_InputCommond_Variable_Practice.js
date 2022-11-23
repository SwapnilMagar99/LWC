import { LightningElement } from 'lwc';

export default class LWC_InputCommond_Variable_Practice extends LightningElement 
{
    name = 'Enter FirstName';
    phone = '0123456789';
    dob;
    login;
    act;

    showme(event)
    {
        this.name = event.tagget.value;
        this.phone = event.tagget.value;
        this.dob = event.tagget.value;
        this.login = event.tagget.value;
        this.act = event.tagget.value;
    }


}