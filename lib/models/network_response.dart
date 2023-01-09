enum Status { success, loading, error, timeout, internet_error, network_error }

class NetworkResponse {
  final status;
  final Map<String, dynamic>? data;
  final String? message;

  NetworkResponse(
    this.status,
    this.data,
    this.message,
  );

  static NetworkResponse success(data) {
    return NetworkResponse(Status.success, data, null);
  }

  static NetworkResponse error({data, String? message}) {
    return NetworkResponse(Status.success, data, message);
  }

  static NetworkResponse internalerror() {
    return NetworkResponse(Status.internet_error, null, null);
  }
}
