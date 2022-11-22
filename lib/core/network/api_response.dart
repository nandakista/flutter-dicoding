class ApiResponse<T> {
  bool error;
  String message;
  T? data;

  ApiResponse({required this.error, required this.message, this.data});

  factory ApiResponse.fromJson(Map<dynamic, dynamic> json) {
    return ApiResponse(
        error: json['error'],
        message: json['message'],
        data: json['data'],
    );
  }
}
