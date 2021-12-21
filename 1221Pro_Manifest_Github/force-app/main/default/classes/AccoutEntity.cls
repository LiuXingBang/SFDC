public with sharing class AccoutEntity {
    public AccoutEntity() {

    }

    public string queryAccount(Id accId)
    {
        string str = 'dev2';
        return [Select Name From Account Where Id=:accId].Name;
    }
}