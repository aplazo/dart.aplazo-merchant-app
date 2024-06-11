class ServerResponse {
  final String status;
  final String message;
  final String error;
  final int timestamp;
  final int code;
  const ServerResponse(
      {required this.status,
      required this.message,
      required this.error,
      required this.timestamp,
      required this.code});
}
