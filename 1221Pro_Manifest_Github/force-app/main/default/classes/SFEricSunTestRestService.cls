@RestResource(urlMapping='/SFEricSunTestRestService')
global class SFEricSunTestRestService {

    @HttpGet
    global static string GetTestRestInfo(){
        string testInfo = 'Hello Rest Service.';
        return testInfo;
    }
}