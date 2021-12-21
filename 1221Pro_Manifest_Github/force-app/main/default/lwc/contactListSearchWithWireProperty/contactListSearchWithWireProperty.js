import { LightningElement, track,wire } from 'lwc';
import findContacts from '@salesforce/apex/ContactController.findContacts';
import {refreshApex} from '@salesforce/apex'
export default class ContactListSearchWithWireProperty extends LightningElement {
    @track searchKey;

    @wire(findContacts, { searchKey: '$searchKey' })
    contacts;

    handleSearch(event) {
        this.searchKey = this.template.querySelector('lightning-input').value;
    }

    handleRefresh(event) {
        refreshApex(this.contacts);
    }
}