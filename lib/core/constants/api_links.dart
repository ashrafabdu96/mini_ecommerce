class ApiLinks {
  // static const String kLinkServer = "http://192.168.1.103/ecommerce";
  // static const String kLinkServer = "http://10.0.2.2/ecommerce";
  static const String kLinkServer = "http://172.28.0.1/ecommerce";
  static const String kLinkTestData = "$kLinkServer/testdata.php";

  ///*********************Images*******************/
  static const String kLinkImagesRoot = "$kLinkServer/upload";
  static const String kLinkCategoriesImages = "$kLinkServer/upload/categories";
  static const String kLinkItemsImages = "$kLinkServer/upload/items";
  static const String kLinkUserImages = "$kLinkServer/upload/users_images";

  /// ***********Auth Links****************/
  static const String kLinkSignUp = "$kLinkServer/auth/signup.php";
  static const String kLinkLogin = "$kLinkServer/auth/login.php";
  static const String kLinkVerifyCodeSign = "$kLinkServer/auth/verifyCode.php";
  static const String kLinkChangePassword =
      "$kLinkServer/auth/change_password.php";
  static const String kLinkAddUserImage =
      "$kLinkServer/auth/add_user_image.php";
  static const String kLinkUserInfo = "$kLinkServer/auth/get_user_info.php";

  /// ***********forget password Links****************/
  static const String kLinkCheckEmail =
      "$kLinkServer/auth/forgetpassword/checkemail.php";
  static const String kLinkVerifyCodeForget =
      "$kLinkServer/auth/forgetpassword/verifycode.php";
  static const String kLinkResetPassword =
      "$kLinkServer/auth/forgetpassword/resetpassword.php";

  /// ********************home***********************/
  static const String kLinkHomeData = "$kLinkServer/home.php";
  static const String kLinkAllCategories = "$kLinkServer/categories/view.php";

  /// ********************items***********************/

  static const String kLinkItemsDataByCat =
      "$kLinkServer/items/ItemsByCategorie.php";
  static const String kLinkItemsDetails =
      "$kLinkServer/items/items_details.php";
  static const String kLinkItemsDetailsProperty =
      "$kLinkServer/items/item_details_properties.php";
  static const String kLinkItemsDetailsCheckBeforeRate =
      "$kLinkServer/items/item_details_check_before_reviews.php";
  static const String kLinkItemsReviews = "$kLinkServer/items/item_reviews.php";

  ///****************cart***************/
  static const String kLinkCartData = "$kLinkServer/cart/cart_items.php";
  static const String kLinkAddToCart = "$kLinkServer/cart/add_to_cart.php";
  static const String kLinkDeleteFromCart =
      "$kLinkServer/cart/delete_from_cart.php";
  static const String kLinkAddToFav =
      "$kLinkServer/favorite/add_to_favorite.php";
  static const String kLinkDeleteFromFav =
      "$kLinkServer/favorite/delete_from_favorite.php";
  static const String kLinkFavoriteData =
      "$kLinkServer/favorite/favorite_items.php";
  static const String kLinkUpdateCartQuantity =
      "$kLinkServer/cart/update_cart_item_quantity.php";

  ///***************address & payment
  static const String kLinkUserAddressData =
      "$kLinkServer/address/get_user_address.php";
  static const String kLinkCityData = "$kLinkServer/address/get_city_info.php";
  static const String kLinkRegionData =
      "$kLinkServer/address/get_address_region_info.php";
  static const String kLinkAddUserAddress =
      "$kLinkServer/address/add_user_address.php";
  static const String kLinkUpdateUserAddress =
      "$kLinkServer/address/update_user_address.php";
  static const String kLinkPaymentInfo =
      "$kLinkServer/payment/insert_payment_info.php";

  ///******************Orders
  static const String kLinkPaymentOrder = "$kLinkServer/orders/add_order.php";
  static const String kLinkGetOrder = "$kLinkServer/orders/get_orders.php";
  static const String kLinkGetOrderDetails =
      "$kLinkServer/orders/get_order_details.php";

  ///*********************Search
  static const String kLinkProductsSearching =
      "$kLinkServer/search/search_for_product.php";
  static const String kLinkProductsSuggestion =
      "$kLinkServer/search/suggestion.php";

  ///*********************test links
  static const String testLink = "$kLinkServer/test.php";
  static const String apiKeyGoogleMaps =
      "AIzaSyAyRW2vFn8UYT46pE0WbEPzEfXW0jcir8o";
}
