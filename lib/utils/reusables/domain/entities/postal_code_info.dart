class PostalCodeInfo {
  PostalCodeInfo({
    required this.id,
    required this.postalCode,
    required this.suburb,
    required this.municipality,
    required this.state,
    required this.stateCdcCode,
    required this.stateCCode,
  });

  final int id;
  final String postalCode;
  final String suburb;
  final String municipality;
  final String state;
  final String stateCdcCode;
  final String stateCCode;
}
