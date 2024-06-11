class Code {
  static const int maxLength = 6;
  final String number;
  const Code({required this.number});
  factory Code.validate(String number) {
    if (number.length == maxLength) {
      return Code(number: number);
    }
    throw 'invalid code';
  }
}
