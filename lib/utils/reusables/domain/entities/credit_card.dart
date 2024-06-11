class CreditCard {
  final String cardNumber;
  final String brand;
  final bool isCvvUpdate;
  final bool bbva;
  final String sourceId;
  final bool haveCreditCard;
  CreditCard(
      {required this.cardNumber,
      required this.brand,
      required this.isCvvUpdate,
      required this.sourceId,
      required this.bbva,
      required this.haveCreditCard});
}
