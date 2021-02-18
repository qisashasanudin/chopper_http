import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:chopper_http/models/built_post.dart';

part 'serializers.g.dart';

@SerializersFor(const [BuiltPost])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();

// {"key": 3, "key2": "title"}
