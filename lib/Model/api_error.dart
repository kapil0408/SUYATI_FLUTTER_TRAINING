class ApiError
{
  String? error;
  ApiError({this.error});

  // String? get error  => _error;
  // set error(String error) => _error = error;

  ApiError.fromJson(Map<String, dynamic> json){
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['error'] = error;
    return data;
  }

}