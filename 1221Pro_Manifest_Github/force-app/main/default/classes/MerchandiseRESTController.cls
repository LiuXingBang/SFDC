/**
 *使用salesforce通过REST方式作为webservice,需要以下几点
 *1、类和方法需要global,方法需要静态
 *2、类需要通过RestResource(UrlMapping='/page/*')注解声明
 *3、@HttpGet和@HttpDelete不能有形参，可以通过URL?param或者URL/param方式传过来参数
**/
@RestResource(UrlMapping='/Merchandise/*')
global class MerchandiseRESTController {
    global static final Integer PAGE_SIZE = 20;
    public static string merchandiseName {get;set;}
    public static string merchandiseId {get;set;}
    
    @HttpGet
    global static List<Account> getMerchandiseByName(){

        List<Account> merchandiseList = Database.query('Select Id,Name From Account limit 10');
        return merchandiseList;
    }
    
    @HttpPost
    global static Id insertMerchandise(String name,String price,String quantity){
        Account acc = new Account();
        acc.Name = name;
        insert acc;
        return acc.Id;
    }
    
    @HttpDelete
    global static void deleteMerchandise(){
        RestRequest request = RestContext.request;
        merchandiseName = request.requestURI.substring(request.requestURI.lastIndexOf('/')+1);
        String querySql = 'select Id from Account where Name =:merchandiseName';
        List<Account> merchandiseList = Database.query(querySql);
        if(merchandiseList!=null){
            delete merchandiseList;
        }
    }
    
    @HttpPut
    global static Id upsertMerchandise(String name,String price,String quantity){
        Account merchandise = new Account();
        merchandise.Name = name;
        
        upsert merchandise;
        return merchandise.Id;
        
    }
    
    /**@HttpPatch
    global static Id updateMerchandise(){
        RestRequest request = RestContext.request;
        merchandiseName = request.requestURI.substring(
               request.requestURI.lastIndexOf('/')+1);
        String querySql = 'select Id from Merchandise__c where Name =:merchandiseName';
        List<Merchandise__c> merchandiseList = Database.query(querySql);
        // Deserialize the JSON string into name-value pairs
        Map<String, Object> params = (Map<String, Object>)JSON.deserializeUntyped(request.requestbody.tostring());
        // Iterate through each parameter field and value
        
    }**/
    
    
    
    
}