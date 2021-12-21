trigger AccountTrigger on Account(after update) {
    List<Account__e> needPublishAccountList = new List<Account__e>();
    for(Account accountItem : (List<Account>)Trigger.new) {
        Account oldAccount = Trigger.oldMap.get(accountItem.Id);
        if(oldAccount != null && oldAccount.Name!= accountItem.Name) {
            Account__e accountPublishItem = new Account__e();
            accountPublishItem.Account_Id__c = accountItem.Id;
            accountPublishItem.After_Name__c = accountItem.Name;
            accountPublishItem.Before_Name__c = oldAccount.Name;
            needPublishAccountList.add(accountPublishItem);
        }
    }

    if(!needPublishAccountList.isEmpty()) {
        List<Database.SaveResult> results = EventBus.publish(needPublishAccountList);
        for (Database.SaveResult sr : results) {
            if (sr.isSuccess()) {
                System.debug('Successfully published event.');
            } else {
                for(Database.Error err : sr.getErrors()) {
                    System.debug('Error returned: ' +
                                err.getStatusCode() +
                                ' - ' +
                                err.getMessage());
                }
            }       
        }
    }

}