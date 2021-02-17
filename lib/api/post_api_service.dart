import 'package:chopper/chopper.dart';
import 'package:chopper_http/api/mobile_data_interceptor.dart';
import 'package:chopper_http/api/not_found_interceptor.dart';
import 'package:chopper_http/api/post_request_interceptor.dart';

part 'post_api_service.chopper.dart';

@ChopperApi(baseUrl: '/posts')
abstract class PostAPIService extends ChopperService {
  // @Get(headers: {'Content-Type': 'text/plain'})
  // Future<Response> getPosts(
  //   @Header('header-name') String headerValue,
  // );

  @Get()
  Future<Response> getPosts();

  @Get(path: '/{id}')
  Future<Response> getPost(
    @Path('id') int id,
  );

  @Post()
  Future<Response> postPost(
    @Body() Map<String, dynamic> body,
  );

  static PostAPIService create() {
    final client = ChopperClient(
      baseUrl: 'https://jsonplaceholder.typicode.com',
      services: [
        _$PostAPIService(),
      ],
      converter: JsonConverter(),
      interceptors: [
        HeadersInterceptor({'Cache-Control': 'no-cache'}),
        CurlInterceptor(),
        HttpLoggingInterceptor(),
        MobileDataInterceptor(),
        POSTRequestInterceptor(),
        NotFoundInterceptor(),
      ],
    );
    return _$PostAPIService(client);
  }
}
