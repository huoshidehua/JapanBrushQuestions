import 'package:dio/dio.dart';

/// 自定义异常
class AppException implements Exception {
  final String _message;
  final int _code;

  AppException([
    this._code,
    this._message,
  ]);

  String toString() {
    return "$_code$_message";
  }

  factory AppException.create(DioError error) {
    switch (error.type) {
      case DioErrorType.CANCEL:
        {
          return BadRequestException(-1, "request cancel");
        }
        break;
      case DioErrorType.CONNECT_TIMEOUT:
        {
          return BadRequestException(-1, "connect timeout");
        }
        break;
      case DioErrorType.SEND_TIMEOUT:
        {
          return BadRequestException(-1, "SEND_TIMEOUT");
        }
        break;
      case DioErrorType.RECEIVE_TIMEOUT:
        {
          return BadRequestException(-1, "RECEIVE_TIMEOUT");
        }
        break;
      case DioErrorType.RESPONSE:
        {
          try {
            int errCode = error.response.statusCode;
            // String errMsg = error.response.statusMessage;
            // return ErrorEntity(code: errCode, message: errMsg);
            switch (errCode) {
              case 400:
                {
                  /// 请求语法错误
                  return BadRequestException(errCode, "request grammer wrong");
                }
                break;
              case 401:
                {
                  /// 没有权限
                  return UnauthorisedException(errCode, "no auth");
                }
                break;
              case 403:
                {
                  /// 服务器拒绝执行
                  return UnauthorisedException(errCode, "server deny");
                }
                break;
              case 404:
                {
                  /// 无法连接服务器
                  return UnauthorisedException(errCode, "cannot connect to server");
                }
                break;
              case 405:
                {
                  /// 请求方法被禁止
                  return UnauthorisedException(errCode, "requst method disable");
                }
                break;
              case 500:
                {
                  /// 服务器内部错误
                  return UnauthorisedException(errCode, "server internal error");
                }
                break;
              case 502:
                {
                  /// 无效的请求
                  return UnauthorisedException(errCode, "bad request");
                }
                break;
              case 503:
                {
                  /// 服务器挂了
                  return UnauthorisedException(errCode, "server stuck");
                }
                break;
              case 505:
                {
                  /// 不支持HTTP协议请求
                  return UnauthorisedException(errCode, "not suport http proxy request");
                }
                break;
              default:
                {
                  // return ErrorEntity(code: errCode, message: "未知错误");
                  return AppException(errCode, error.response.statusMessage);
                }
            }
          } on Exception catch (_) {
            /// 未知错误
            return AppException(-1, "unknow error");
          }
        }
        break;
      default:
        {
          return AppException(-1, error.message);
        }
    }
  }
}

/// 请求错误
class BadRequestException extends AppException {
  BadRequestException([int code, String message]) : super(code, message);
}

/// 未认证异常
class UnauthorisedException extends AppException {
  UnauthorisedException([int code, String message]) : super(code, message);
}