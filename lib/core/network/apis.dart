
class ConstantApis {
  static const String baseUrl = "https://apiultramarket.vercel.app";
  static const String login = "/user/login";
  static const String signup = "/user/signup";
  static const String getProducts = "/products/bestdeals";
  static const String getProductsDetail = "/products/product/";
  static const String getCategories = "/categories";
}
class ApiErrors {
  static const String badRequestError = "badRequestError";
  static const String noContent = "noContent";
  static const String forbiddenError = "forbiddenError";
  static const String unauthorizedError = "unauthorizedError";
  static const String notFoundError = "notFoundError";
  static const String conflictError = "conflictError";
  static const String internalServerError = "internalServerError";
  static const String unknownError = "unknownError";
  static const String timeoutError = "timeoutError";
  static const String defaultError = "defaultError";
  static const String cacheError = "cacheError";
  static const String noInternetError = "noInternetError";
  static const String loadingMessage = "loading_message";
  static const String retryAgainMessage = "retry_again_message";
  static const String ok = "Ok";
}