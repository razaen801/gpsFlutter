// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_api_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _NetworkApiClient implements NetworkApiClient {
  _NetworkApiClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'http://202.51.74.204/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<SubmitLocationResponse> submitLocation(
      token, id, longitude, latitude) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'deviceId': id,
      r'lng': longitude,
      r'lat': latitude
    };
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<SubmitLocationResponse>(Options(
                method: 'POST',
                headers: <String, dynamic>{r'Authorization': token},
                extra: _extra)
            .compose(_dio.options, 'api/device/location',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = SubmitLocationResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<AllLocationResponse> getAllLocation(token) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<AllLocationResponse>(Options(
                method: 'GET',
                headers: <String, dynamic>{r'Authorization': token},
                extra: _extra)
            .compose(_dio.options, 'api/device/location',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AllLocationResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<AllGpsLocationResponse> getAllGpsDevice(token) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<AllGpsLocationResponse>(Options(
                method: 'GET',
                headers: <String, dynamic>{r'Authorization': token},
                extra: _extra)
            .compose(_dio.options, 'api/device/list',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AllGpsLocationResponse.fromJson(_result.data!);
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
