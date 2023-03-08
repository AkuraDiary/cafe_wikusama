  class BaseResponse<T> {
  String status;
  T value;

  BaseResponse({required this.status, required this.value});

  factory BaseResponse.fromJson(Map<String, dynamic> json, T Function(dynamic) fromJson) {
  var status = json['status'];
  var value = fromJson(json['value']);
  return BaseResponse(status: status, value: value);
  }

  Map<String, dynamic> toJson() {
  return {
  'status': status,
  'value': value.toJson(),
  };
  }
  }
