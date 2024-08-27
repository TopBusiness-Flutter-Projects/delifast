class EndPoints {
  static const String baseUrl = "https://demo17.topbuziness.com";
  // static String baseUrl = "";
  static String db = "demo17.topbuziness.com";

  ///
  static String auth = "$baseUrl/auth/";
  static String register = "$baseUrl/api/res.users/";
 // static String updatePartner = "$baseUrl/api/res.partner/";
  static String allCategoriesUrl =
      '$baseUrl/api/product.category?query={id, name,image}&filter=[["is_available","=","true"]]';
  static String categoryUrl = "$baseUrl/api/product.category/";
  static String allProducts = '$baseUrl/api/product.template/';
  static String authWithSession = "$baseUrl/web/session/authenticate";
  static String allCategoryProducts = '$baseUrl/api/product.product/';
  static String getOffers =
      '$baseUrl/api/offer/?query={ad_url,id,offer_des,service_offer,service_id,offer_type,image}';
  static String getProviders =
      '$baseUrl/api/res.users?query={id, name,partner_id,image_1920,partner_latitude,partner_longitude}&filter=[["user_type","=","provider"]]';
  static String getProviderDetails = '$baseUrl/api/res.users';
  static String geAbout = '$baseUrl/api/about/?query={about}';
  static String getPhone = '$baseUrl/api/support/?query={phone}';
  static String getPolicy =
      '$baseUrl/api/privacy.policy/?query={privacy_policy}';
  static String getProvidersWithFilters =
      '$baseUrl/api/res.users?query={id, name,partner_id,image_1920,partner_latitude,partner_longitude}&';
  static String getProviderRates = '$baseUrl/api/evaluation/';
  static String getAllPartners = '$baseUrl/api/res.partner?';
  // '$baseUrl/api/res.partner?query={name,id, phone,total_overdue,total_due,total_invoiced,sale_order_ids,credit_to_invoice}';
  // static String getUserData =
  //     '$baseUrl/api/res.users/?query={id, name,partner_id,image_1920,login,street,favorite_user_ids}';
  static String addPartner = '$baseUrl/api/res.partner/';
  static String userUrl = '$baseUrl/api/res.users/';
  static String newLead = '$baseUrl/api/crm.lead/';
  static String companyData = '$baseUrl/api/res.company/?';
  static String currencyName = '$baseUrl/api/res.currency/?';
  static String createPicking = '$baseUrl/api/stock.picking/';
  static String objectSaleOrder = '$baseUrl/object/sale.order/';
  static String objectAccountMove = '$baseUrl/object/account.move/';
  static String createStokeMove = '$baseUrl/api/stock.move';
  static String getTaxes =
      '$baseUrl/api/account.tax/?query={id, display_name}&';
  static String fromLocation =
      '$baseUrl/api/stock.location/?query={id,name}&filter=[["usage", "=", "internal"]]';
  static String toLocation =
      '$baseUrl//api/stock.location/?query={id,name}&filter=[["usage", "=", "internal"]]';

  static String saleOrder = '$baseUrl/api/sale.order/';
  static String order = '$baseUrl/api/order/';
  static String complain = '$baseUrl/api/complain/';
  static String project = '$baseUrl/api/project/';
  static String wareHouse = '$baseUrl/api/stock.warehouse/';
  static String saleOrderLine = '$baseUrl/api/sale.order.line';
  static String getSaleOrder = '$baseUrl/api/sale.order/';
  static String createPayment = '$baseUrl/api/account.payment/';
  static String confirmPayment = '$baseUrl/object/account.payment/';
  static String createInvoice = '$baseUrl/api/account.move/';
 
 
  static String invoiceLine = '$baseUrl/api/account.move.line';
 // thanaa  
  static String getAllJournals =
      '$baseUrl/api/account.journal/?query={id, display_name}';
        static String ordersUrl = "$baseUrl/api/dev.courier.request/?";
 // nehal 

 static String updatePartner = "$baseUrl/api/res.users/";
  static String getUserData =
      '$baseUrl/api/res.users/?query={id, name,mobile,street,email,image_1920}';
}


//d