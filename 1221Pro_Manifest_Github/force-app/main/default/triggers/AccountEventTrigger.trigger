trigger AccountEventTrigger on Account__e (after insert) {
    List<Task> taskList = new List<Task>();
    for (Account__e accountEvent : Trigger.New) {
        Task taskItem = new Task();
        taskItem.Subject = 'Name change reminder';
        taskItem.Description = 'old name: ' + accountEvent.Before_Name__c + ' new name : ' + accountEvent.After_Name__c;
        taskItem.ActivityDate = System.today();
        taskItem.Priority = 'Medium';
        taskItem.OwnerId = UserInfo.getUserId();
        taskList.add(taskItem);
    }
    insert taskList;
}