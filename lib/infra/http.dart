import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../data/helpers/helpers.dart';
import '../data/models/models.dart';
import '../data/services/services.dart';
import '../env/env.dart';

class HttpService implements HttpClient {
  HttpService() {
    httpClient.options.followRedirects = false;
    httpClient.options.validateStatus = (status) => status! < 5000;
    httpClient.options.sendTimeout = 60 * 1000;
    httpClient.options.receiveTimeout = 60 * 1000;
  }

  final Dio httpClient = Dio();

  @override
  Future<HttpResponse> call(
    HttpMethod type,
    String url, {
    Map<String, dynamic>? data,
    Map<String, String>? headers,
  }) async {
    // Set http client base url
    httpClient.options.baseUrl = url.startsWith("http") ? url : Env.to!.baseUrl!;

    // Change http header request
    httpClient.options.headers.clear();
    if (headers != null) httpClient.options.headers.addAll(headers);

    // General headers settings
    httpClient.options.headers.addAll({
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    });

    url = url + "&key=${Env.to!.token}";

    late Response response;
    switch (type) {
      case HttpMethod.get:
        response = await httpClient.get(url, queryParameters: data);
        break;
      case HttpMethod.post:
        response = await httpClient.post(url, data: data);
        break;
    }

    if (Env.to!.ambiente == 'dev') {
      log("======start======");
      log("url: ${type.toString()} ${httpClient.options.baseUrl}$url");
      debugPrint("params: $data", wrapWidth: 1024);
      debugPrint("headers: ${httpClient.options.headers}", wrapWidth: 1024);
      log("status: ${response.statusCode}");
      debugPrint("response: ${response.data}", wrapWidth: 1024);
      log("=======end=======");
    }

    switch (response.statusCode) {
      case 200:
        return HttpResponse(response.data, HttpStatus.success);
      default:
        throw HttpResponse(response.data, HttpStatus.unexpected);
    }
  }
}
