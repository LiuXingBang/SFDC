import { LightningElement, api } from 'lwc';

export default class ParentLifeCycle extends LightningElement {
    
    @api
    show;

    constructor(){
        super();
        this.show = false;//子组件不会被显示，即刚开始并不会有子组件中任何函数的信息
        console.log('parent constructor');
    }

    handleButtonClick(event){
        this.show = event.target.checked;
    }

    connectedCallback(){
        console.log('the parentClass from connectedCallback => ' + this.template.querySelector('lightning-input'));
        console.log('parent has been insert into Dom');
    }

    renderedCallback(){
        console.log('the parentClass from renderedCallback => ' + this.template.querySelector('lightning-input'));
        console.log('parent has been rendered');
    }

    disconnectedCallback(){
        console.log('parent has been disconnected');
    }
}