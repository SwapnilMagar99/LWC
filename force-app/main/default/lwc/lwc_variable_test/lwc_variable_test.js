import { LightningElement } from 'lwc';

export default class Lwc_variable_test extends LightningElement 
{
    name = 'Swapnil Magar';
    age = 27;
    phone ='9405965819'; 
    emp= 'ERP-71';

    callme()
    {
        this.name = 'Krushna Magar';
        this.age = 30;
        this.phone = '7030307200';
        this.emp = 'ERP-69';
    }
}