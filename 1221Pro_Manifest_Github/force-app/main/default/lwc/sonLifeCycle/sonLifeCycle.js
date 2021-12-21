import { LightningElement } from 'lwc';

export default class SonLifeCycle extends LightningElement {
    
    constructor(){
        super();
        console.log('son constructor');
    }

    connectedCallback(){
        console.log('son has been insert into Dom');
    }

    renderedCallback(){
        console.log('son has been rendered');
    }

    disconnectedCallback(){
        console.log('son has been disconnected');
    }
}