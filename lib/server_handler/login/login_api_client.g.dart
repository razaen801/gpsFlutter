// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_api_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _LoginApiClient implements LoginApiClient {
  _LoginApiClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'http://202.51.74.204/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<LoginResponse> loginUser(email, password, type) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'email': email,
      r'password': password
    };
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<LoginResponse>(Options(
                method: 'POST',
                headers: <String, dynamic>{r'Content-type': type},
                extra: _extra,
                contentType: type)
            .compose(_dio.options, 'api/login',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = LoginResponse.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
