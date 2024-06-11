class InformationError {
  InformationError(
      {required this.code,
      required this.image,
      required this.title,
      required this.description,
      this.supportMessage,
      required this.template,
      this.mainTitleButton,
      this.secondaryTitleButton,
      this.referenceCode});

  final int code;
  final String image;
  final String title;
  String? referenceCode;
  final String description;
  final String? supportMessage;
  final InformationErrorType template;
  final String? mainTitleButton;
  final String? secondaryTitleButton;
}

enum InformationErrorType {
  closeSession,
  tryAgain,
  support,
  closeModal,
  home,
  replaceCard,
  suggestReplaceCard,
  link,
  promoError,
  order,
  redirectOrders
}

class InformationErrorExtension {
  static InformationErrorType get(String status) {
    switch (status) {
      case 'close_session':
        return InformationErrorType.closeSession;
      case 'support':
        return InformationErrorType.support;
      case 'replace_card':
        return InformationErrorType.replaceCard;
      case 'suggest_replace_card':
        return InformationErrorType.suggestReplaceCard;
      case 'try_again':
        return InformationErrorType.tryAgain;
      case 'close_modal':
        return InformationErrorType.tryAgain;
      case 'home':
        return InformationErrorType.home;
      case 'order':
        return InformationErrorType.order;
      case 'promo_error':
        return InformationErrorType.promoError;
      case 'redirect_orders':
        return InformationErrorType.redirectOrders;
      default:
        return InformationErrorType.tryAgain;
    }
  }
}
