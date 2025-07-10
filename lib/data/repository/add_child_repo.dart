import 'package:burla_xatun/data/contractor/add_child_contract.dart';
import 'package:burla_xatun/data/services/remote/add_child_service.dart';
import 'package:dio/src/response.dart';

class AddChildRepo implements AddChildContract {
  AddChildRepo(this.addChildService);

  final AddChildService addChildService;

  @override
  Future<Response<dynamic>> addChild({
    Map<String, dynamic>? postData,
  }) {
    return addChildService.addChild(postData: postData);
  }
}
