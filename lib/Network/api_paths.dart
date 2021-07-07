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


const companyInfo = "InvestorsRelation/CompanyInfo";
const getFinancialStatementsWithHistory = "InvestorsRelation/GetFinancialStatementsWithHistory?&period=%@&limit=%d";
const getFinancialReports = "InvestorsRelation/GetFinancialPDFReports?period=%@&periodval=%@&year=%@";
const getCompanyBoardMembers = "InvestorsRelation/CompanyBoardManagementMembers?companyPositionType=%@";
const majorShareholdersURL = "InvestorsRelation/CompanyMajorShareHolders";
const getFinancialRatiosWithHistoryURL = "InvestorsRelation/GetFinancialRatioWithHistory?period=%@&limit=%d";
const getAllFinancialPDFReportsURL = "InvestorsRelation/GetAllFinancialPDFReports";
const getpressReleaseURL =  "InvestorsRelation/GetPressReleases?languageId=%@&pageno=%i";
const getEventsURL = "InvestorsRelation/GetEevents";
const getCompanyProfileURL = "InvestorsRelation/CompanyProfile";
const getLatestCompanyHeaderValues = "InvestorsRelation/GetLatestCompanyHeaderValues";
const chartURL = "InvestorsRelation/GetCompanyChart";
const getLatestMarketResultURL = "InvestorsRelation/GetLatestMarketResult";
const getFinancialRatioURL =  "InvestorsRelation/GetFinancialRatio";
const getSectionArticleURL = "InvestorsRelation/GetSectionArticles?sectionId=%@&langaugeId=%@&records=%@&pageno=%i";
const getArticleDetailURL =  "InvestorsRelation/ArticleDetail?articleId=%@&langId=%@";
const getpressReleaseDetailURL = "InvestorsRelation/GetPressRelease?pressReleaseId=%@";
const sendDeviceTokenURL =   "InvestorsRelation/RegisterEndPoint?deviceToken=%@&deviceType=%@&version=%@&osVersion=%@&timeZone=%@";
const getNotificationsEnableURL =  "InvestorsRelation/EnableNotifications?notificationType=%@&lang=%@";
const getNotificationsDisableURL = "InvestorsRelation/DisableNotifications?notificationType=%@&lang=%@";
const getRelatedApps = "InvestorsRelation/RelatedApps";
const getAppConfig = "InvestorsRelation/AppsConfigs";
const getCompanyDisclaimer = "InvestorsRelation/GetCompanyDisclaimer";
const investorsPresentation = "InvestorsRelation/InvestorsPresentation?reporttypeid=%@";
const getMenu = "InvestorsRelation/GetMenu";
const getIRCorporateGovernance = "InvestorsRelation/IRCorporateGovernance";
const getBusinessSegments = "InvestorsRelation/GetBusinessGeographicSegment?period=%@&limit=%d";
const getContactOfficials = "InvestorsRelation/GetContactOfficials";
const getPDFLinksByMenu = "InvestorsRelation/GetPDFLinksByMenu?menu=%@";
const getSocialResponsibility = "InvestorsRelation/GetSocialResponsibility?resultType=json";
const addCompanyStockChange = "/InvestorsRelation/AddCompanyStockChange";