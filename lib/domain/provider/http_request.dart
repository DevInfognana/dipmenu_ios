
class BaseAPI {

  // static var base='https://dipmenu-api-dev.demomywebapp.com';
  // static var base='http://api-dipmenu.demomywebapp.com:8080';
  static var base='https://api.dipmenu.com';
  // static var base='https://dipmenu-api-uat.demomywebapp.com';
  // static var base='http://172.16.0.121:3000';
  static var api = "$base/api/v2";
  // static var api = "$base/api/v1";
  static var signInAPI = "$api/auth/signin";
  static var signUpAPI = "$api/auth/signup";
  static var profileAPI = "$api/user/profile";
  static var updateProfile = "$api/user/profileupdate";
  static var cartListApi = "$api/website/cartlists";
  static var cartListTaxGetApi = "$api/website/generalsetting";
  static var cartListTaxDecryptApi = "$api/website/getdecrypt";
  static var giftCardApi = "$api/website/validateGiftcard";
  static var removeCartApi = "$api/website/removecart";
  static var updateQuanity = "$api/website/updateQuantity";
  static var addCart = "$api/website/addtocart";
  static var updateCart = "$api/website/updatecart";
  static var recentOrder = "$api/order/recentOrder";
  static var checkrecentcard = "$api/order/checkcardtype";
  static var paymentAPI = "$api/order/payment";
  static var newOrder = "$api/order/newOrder";
  static var rewardProduct = "$api/website/products?query=&page=0&limit=0&sortby=&order=&reward=1";
  static var createOrder = "$api/order/CreateReorder";
  static var forgotpassword = "$api/auth/forgot-password";
  static var resetpassword = "$api//user/passwordupdate";
  static var scheduleTime = "$api/order/getscheduleTime";
  static var updateOrder="$api/order/UpdateOrderDetails";
  static var createPdf="$api/order/CreateOrderPdf/";
  // static var colorPlaate="$api/colorpicker/getColorList";
  static var colorPlaate="$api/colorpicker/getSavedColors";
  static var addCoupon="$api/user/addtocoupon";
  static var checkCoupon="$api/user/checkCoupon";
  static var checkWallet="$api/user/addtowallet";
  static var gpsUpdate = "$api/order/gpsUpdate";
  static var getGiftList = "$api/user/getGiftList";
  static var getGiftCards = "$api/user/giftcards";
  static var mobilePayment = "http://customer-dipmenu.demomywebapp.com:8080/mobilepayment/";
  static var addFavourite = "$api/website/addtofavorites";
  static var removeFavourite = "$api/website/removefavorites";
  static var validateMobileToken = "$api/auth/validateMobileToken";
  // static  var googlePayTest="https://testpayments.worldnettps.com/merchant/paymentpage";
  static  var googlePayTest="https://testpayments.worldnettps.com/merchant/paymentpage?TERMINALID=5271001&ORDERID=232&CURRENCY=USD&DATETIME=05-29-2023:21:01:21:906&AMOUNT=10.00&HASH=317da6a0cfa7839ced7fd3371a42e7dce2418003db7f8a51ed57e5e14163d867740233fc17b048968737e540b2d2b53cdf999714d639b27b2030109266e8e22c";
   var checkInApi="$api/order/updateCheckin";

  static var mobileGiftCardCheck = "$api/user/mobileGiftcardcheck";
  static var mobileWalletCheck = "$api/user/mobileWalletcheck";
  static var mobileOrder = "$api/order/mobileOrder";
  static var deleteAccountAPI = "$api/user";
  static var getAppVersionAPI = "$api/general/getAppVersion";   //https://api.dipmenu.com/api/v1/general/getAppVersion


}


