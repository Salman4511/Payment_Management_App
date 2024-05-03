import 'package:get/get.dart';
import 'package:payment_management_app/models/user/user_model.dart';
import 'package:payment_management_app/services/local_database/user_db_helper.dart';

class UserDatabaseController extends GetxController {
  late UserDatabaseHelper _userdatabaseHelper;
  RxList<UserModel> user = <UserModel>[].obs;
  @override
  void onInit() {
    _userdatabaseHelper = UserDatabaseHelper();

    UserModel defaultUser = UserModel(
      id: 1,
      name: 'Mae Jamison',
      mailId: 'maej@gmail.com',
      balance: 204.05,
      profilePicture:
          'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8ZmVtYWxlJTIwcHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D',
    );
    _userdatabaseHelper.insertUser(defaultUser);
    refreshUser();
    super.onInit();
  }

  Future<void> refreshUser() async {
    final userList = await _userdatabaseHelper.getUser();
    user.assignAll(userList);
  }
}
