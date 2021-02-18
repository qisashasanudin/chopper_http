import 'package:built_value/built_value.dart';
import 'package:chopper/chopper.dart';
import 'package:chopper_http/api/built_value_converter.dart';
import 'package:chopper_http/api/mobile_data_interceptor.dart';
import 'package:chopper_http/api/not_found_interceptor.dart';
import 'package:chopper_http/api/post_request_interceptor.dart';
import 'package:chopper_http/models/built_post.dart';
import 'package:built_collection/built_collection.dart';

part 'post_api_service.chopper.dart';

@ChopperApi(baseUrl: '/posts')
abstract class PostAPIService extends ChopperService {
  // @Get(headers: {'Content-Type': 'text/plain'})
  // Future<Response> getPosts(
  //   @Header('header-name') String headerValue,
  // );

  @Get()
  Future<Response<BuiltList<BuiltPost>>> getPosts();

  @Get(path: '/{id}')
  Future<Response<BuiltPost>> getPost(
    @Path('id') int id,
  );

  @Post()
  Future<Response<BuiltPost>> postPost(
    @Body() BuiltPost body,
  );

  static PostAPIService create() {
    final client = ChopperClient(
      baseUrl: 'https://jsonplaceholder.typicode.com',
      services: [
        _$PostAPIService(),
      ],
      converter: BuiltValueConverter(),
      interceptors: [HttpLoggingInterceptor()],
    );
    return _$PostAPIService(client);
  }
}
