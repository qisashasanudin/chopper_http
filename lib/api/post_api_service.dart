import 'package:chopper/chopper.dart';

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
    );
    return _$PostAPIService(client);
  }
}
