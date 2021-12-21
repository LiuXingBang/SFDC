import { LightningElement,track } from 'lwc';

export default class TestLookUpForLwc extends LightningElement {
    handleSubmit(event) {
        event.preventDefault();
        console.log(JSON.stringify(event.detail.fields.Test_User__c));
    }
}