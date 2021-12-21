/*
* 使用salesforce通过REST方式作为webservice，需要以下几点：
* 1.类和方法需要global，方法需要静态
* 2.类需要通过RestResource（UrlMapping='/page/*'）注解声明
* 3.@HttpGet和@HttpDelete不能有形参，可以通过URL?param或者URL/param方式传过来参数
*/
@RestResource(UrlMapping='/Account/*')
global class GoodsRESTController {
    global static final Integer PAGE_SIZE = 20;
    @HttpGet
    global static List<Account> getGoodsByIdOrGoodsList() {
        RestRequest request = RestContext.request;
        // grab the goodsId from the end of the URL
        String currentPage = request.params.get('currentPage') != null ? request.params.get('currentPage') : '0';
        Integer offsetNumber = Integer.valueOf(currentPage) * PAGE_SIZE;
        String goodsId = request.params.get('AccountId');
        String fetchSql;
        if(goodsId != null) {
            fetchSql = 'SELECT CreatedById, CreatedDate, IsDeleted, Name,Id FROM Account' +
            ' where Id = :goodsId';
        } else {
            fetchSql = 'SELECT CreatedById, CreatedDate, IsDeleted, Name, Id FROM Account limit :PAGE_SIZE offset :offsetNumber';
        }
        List<Account> goodsList = [SELECT CreatedById, CreatedDate, IsDeleted, Name,Id FROM Account where Id='0015j00000ACOqq'];
        return goodsList;
    }


    @HttpPost
    global static Id insertGoods(String goodsName) {
        System.debug('---------goodsName-------------' + goodsName);
        Account goods = new Account();
        
        goods.Name = goodsName;
        
        insert goods;
        return goods.Id;
    }


    


}