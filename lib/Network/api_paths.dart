const String AlbumUrl = "https://jsonplaceholder.typicode.com/albums/1";
const String apiSocialResponsibilityUrl =
    "InvestorsRelation/GetSocialResponsibility";
const String apiBoardMembers =
    "InvestorsRelation/CompanyBoardManagementMembers";
const String apiCompanyChart = "InvestorsRelation/GetCompanyChart";
const String apiNewsSections = "InvestorsRelation/GetSectionArticles";


class ApiUrls {
  static Map<String, String> headers = {
    "Device-Token": DeviceToken,
    "App-Secret": APP_SECRET,
    "Content-Type": "application/json"
  };
  static String APP_SECRET = "9E47F5227FAF2C35DB01808106EF10DE";
  static String DeviceToken = "1234";
  static String Device_Token = ""; //IR SHG

//BoardMembers
  static String CompanyID = "companyID";
  static String CompanyPositionType = "companyPositionType";
}

const String BaseUrl = "http://irapi.argaam.com/v1.2/json/";
const companyInfo = BaseUrl + "InvestorsRelation/CompanyInfo";
const getFinancialStatementsWithHistory = BaseUrl + "InvestorsRelation/GetFinancialStatementsWithHistory?&period=%@&limit=%d";
const getFinancialReports = BaseUrl + "InvestorsRelation/GetFinancialPDFReports?period=%@&periodval=%@&year=%@";
const getCompanyBoardMembers = BaseUrl + "InvestorsRelation/CompanyBoardManagementMembers";
const majorShareholdersURL = BaseUrl + "InvestorsRelation/CompanyMajorShareHolders";
const getFinancialRatiosWithHistoryURL = "BaseUrl + InvestorsRelation/GetFinancialRatioWithHistory?period=%@&limit=%d";
const getAllFinancialPDFReportsURL = BaseUrl + "InvestorsRelation/GetAllFinancialPDFReports";
const getpressReleaseURL =  BaseUrl + "InvestorsRelation/GetPressReleases?languageId=%@&pageno=%i";
const getEventsURL = BaseUrl + "InvestorsRelation/GetEevents";
const getCompanyProfileURL = BaseUrl + "InvestorsRelation/CompanyProfile";
const getLatestCompanyHeaderValues = BaseUrl + "InvestorsRelation/GetLatestCompanyHeaderValues";
const chartURL = BaseUrl + "InvestorsRelation/GetCompanyChart";
const getLatestMarketResultURL = BaseUrl + "InvestorsRelation/GetLatestMarketResult";
const getFinancialRatioURL =  BaseUrl + "InvestorsRelation/GetFinancialRatio";
const getSectionArticleURL = BaseUrl + "InvestorsRelation/GetSectionArticles?sectionId=%@&langaugeId=%@&records=%@&pageno=%i";
const getArticleDetailURL =  BaseUrl + "InvestorsRelation/ArticleDetail?articleId=%@&langId=%@";
const getpressReleaseDetailURL = BaseUrl + "InvestorsRelation/GetPressRelease?pressReleaseId=%@";
const sendDeviceTokenURL =  BaseUrl + "InvestorsRelation/RegisterEndPoint?deviceToken=%@&deviceType=%@&version=%@&osVersion=%@&timeZone=%@";
const getNotificationsEnableURL =  BaseUrl + "InvestorsRelation/EnableNotifications?notificationType=%@&lang=%@";
const getNotificationsDisableURL = BaseUrl + "InvestorsRelation/DisableNotifications?notificationType=%@&lang=%@";
const getRelatedApps = BaseUrl + "InvestorsRelation/RelatedApps";
const getAppConfig = BaseUrl + "InvestorsRelation/AppsConfigs";
const getCompanyDisclaimer = BaseUrl + "InvestorsRelation/GetCompanyDisclaimer";
const investorsPresentation = BaseUrl + "InvestorsRelation/InvestorsPresentation?reporttypeid=%@";
const getMenu = BaseUrl + "InvestorsRelation/GetMenu";
const getIRCorporateGovernance = BaseUrl + "InvestorsRelation/IRCorporateGovernance";
const getBusinessSegments = BaseUrl + "InvestorsRelation/GetBusinessGeographicSegment?period=%@&limit=%d";
const getContactOfficials = BaseUrl + "InvestorsRelation/GetContactOfficials";
const getPDFLinksByMenu = BaseUrl + "InvestorsRelation/GetPDFLinksByMenu?menu=%@";
const getSocialResponsibility = BaseUrl + "InvestorsRelation/GetSocialResponsibility?resultType=json";
const addCompanyStockChange = BaseUrl + "InvestorsRelation/AddCompanyStockChange";