trigger AccountChangeEventTrigger on AccountChangeEvent (after insert) {
	List<Task> tasks = new List<Task>();
    for (AccountChangeEvent event : Trigger.New) 
    {
        EventBus.ChangeEventHeader header = event.ChangeEventHeader;
        Task tk = new Task();
        tk.Subject = 'Account Change: ' + header.recordIds;
        tk.OwnerId = header.CommitUser;
        tasks.add(tk);
    }
    insert tasks;
}