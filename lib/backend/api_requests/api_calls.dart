import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class GetAddressesCall {
  static Future<ApiCallResponse> call({
    String? querytext = '',
    String? apiKey = '',
    String? latitude = '',
    String? longitude = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getAddresses',
      apiUrl:
          'https://maps.googleapis.com/maps/api/place/textsearch/json?query=${querytext}&key=${apiKey}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? addresstitle(dynamic response) => (getJsonField(
        response,
        r'''$.results[:].formatted_address''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<double>? lat(dynamic response) => (getJsonField(
        response,
        r'''$.results[:].geometry.location.lat''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  static List<double>? lng(dynamic response) => (getJsonField(
        response,
        r'''$.results[:].geometry.location.lng''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
}

class SendNotificationCall {
  static Future<ApiCallResponse> call({
    String? content = '',
    String? heading = '',
    String? subtitle = '',
    String? appId = '',
    List<String>? useridslistList,
  }) async {
    final useridslist = _serializeList(useridslistList);

    final ffApiRequestBody = '''
{
  "target_channel": "push",
  "contents": {
    "en": "${escapeStringForJson(content)}",
    "ru": "${escapeStringForJson(content)}"
  },
  "headings": {
    "en": "${escapeStringForJson(heading)}",
    "ru": "${escapeStringForJson(heading)}"
  },
  "subtitle": {
    "en": "${escapeStringForJson(subtitle)}",
    "ru": "${escapeStringForJson(subtitle)}"
  },
  "app_id": "${escapeStringForJson(appId)}",
  "include_aliases": {
    "external_id": ${useridslist}
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'SendNotification',
      apiUrl: 'https://api.onesignal.com/notifications?c=push',
      callType: ApiCallType.POST,
      headers: {
        'accept': 'application/json',
        'content-type': 'application/json',
        'Authorization':
            'os_v2_app_w2asoeabunhpfau5pobivhnrnvkyyhbjawdezwvh6jnnideevsdpnl4d4xvfw6z7n25tyzibpuskrejvdnrmsejvgkguwm5v2w4ka2i',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
