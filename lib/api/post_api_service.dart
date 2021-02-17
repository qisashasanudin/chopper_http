import 'package:chopper/chopper.dart';
import 'package:chopper_http/api/mobile_data_interceptor.dart';

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
        (Request request) async {
          if (request.method == HttpMethod.Post) {
            chopperLogger.info('Performed a POST request');
          }
          return request;
        },
        (Response response) async {
          if (response.statusCode == 404) {
            chopperLogger.severe('404 NOT FOUND');
          }
          return response;
        },
      ],
    );
    return _$PostAPIService(client);
  }
}
