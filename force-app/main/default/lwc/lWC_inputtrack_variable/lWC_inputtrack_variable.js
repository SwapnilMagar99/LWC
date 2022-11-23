import { LightningElement,track } from 'lwc';

export default class LWC_inputtrack_variable extends LightningElement 
{
    @track resvalue;
    num1;
    num2;    

    Callme(event)
    {
        const evtname = event.target.name;
        if(evtname==='aval')
        {
            this.num1 = event.target.value      
        }
        else
        {
            this.num2 = event.target.value
        }
    }
    add()
    {
        const a = parseInt(this.num1, 10);
        const b = parseInt(this.num2 , 10);
        this.resvalue = 'The addition result is :- ' + (a+b);
    }
    Sub()
    {
        const a = parseInt(this.num1,10);
        const b = parseInt(this.num2, 10);
        this.resvalue = 'The Substraction result is :- ' + (a-b);
    }
    Mul()
    {
        const a = parseInt(this.num1,10);
        const b = parseInt(this.num2,10);
        this.resvalue = 'The Multiply result is :- ' + (a*b);
    }
}