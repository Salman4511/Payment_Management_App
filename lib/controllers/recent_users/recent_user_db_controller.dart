import 'package:get/get.dart';
import 'package:payment_management_app/models/recent_user_payment_model/recent_user_payment_model.dart';
import 'package:payment_management_app/services/local_database/recent_user_db_helper.dart';

class RecentUserDatabaseController extends GetxController {
  late RecentUserDatabaseHelper _recentUserDatabaseHelper;
  RxList<RecentUserPaymentModel> recentUsers = <RecentUserPaymentModel>[].obs;

  @override
  void onInit() {
    _recentUserDatabaseHelper = RecentUserDatabaseHelper();

    _insertInitialUsers();
    refreshUsers();
    super.onInit();
  }

  Future<void> _insertInitialUsers() async {
    try {
      for (var user in initialRecentUsers) {
        await _recentUserDatabaseHelper.insertUser(user);
      }
    } catch (e) {
      // ignore: avoid_print
      print('Error inserting users: $e');
    }
  }

  Future<void> refreshUsers() async {
    final userList = await _recentUserDatabaseHelper.getRecentUser();
    recentUsers.assignAll(userList);
  }
  final List<RecentUserPaymentModel> initialRecentUsers = [
    RecentUserPaymentModel(
      id: 1,
      name: 'Johny',
      secondName: 'Chimbo',
      profilePicture: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRscCytvWC2M6bqUR5EtpzVmDbVbPrAtlA2FrNDuUHgsg&s',
    ),
    RecentUserPaymentModel(
      id: 2,
      name: 'Gail',
      secondName: 'Monnet',
      profilePicture: 'https://images.unsplash.com/photo-1480455624313-e29b44bbfde1?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8bWFsZSUyMHByb2ZpbGV8ZW58MHx8MHx8fDA%3D',
    ),
    RecentUserPaymentModel(
      id: 2,
      name: 'Venessa',
      secondName: 'Kopp',
      profilePicture: 'https://hips.hearstapps.com/hmg-prod/images/street-portrait-of-a-young-man-using-mobile-phone-royalty-free-image-1018047498-1564431457.jpg?crop=0.668xw:1.00xh;0.226xw,0&resize=640:*',
    ),
    RecentUserPaymentModel(
      id: 2,
      name: 'Deloress',
      secondName: 'Rathbun',
      profilePicture: 'https://img.freepik.com/free-photo/portrait-man-having-great-time_23-2149443790.jpg?size=626&ext=jpg&ga=GA1.1.553209589.1714348800&semt=ais',
    ),
    RecentUserPaymentModel(
      id: 2,
      name: 'Roshel',
      secondName: 'Deshong',
      profilePicture: 'https://media.istockphoto.com/id/1346530154/photo/profile-of-thoughtful-young-businessman-looking-down.jpg?s=612x612&w=0&k=20&c=2fiXHRlCH0msjzWyqjP8J5LK8ABhxSzYvIRcw6hgHN0=',
    ),
    RecentUserPaymentModel(
      id: 2,
      name: 'Alice',
      secondName: 'Smith',
      profilePicture: 'https://w0.peakpx.com/wallpaper/107/46/HD-wallpaper-best-pose-for-profile-for-men-profile-pose-men-best-glasses.jpg',
    ),
    RecentUserPaymentModel(
      id: 2,
      name: 'Smith',
      secondName: 'Alice',
      profilePicture: 'https://img.freepik.com/free-photo/portrait-man-laughing_23-2148859448.jpg?size=338&ext=jpg&ga=GA1.1.1224184972.1714521600&semt=ais',
    ),
    RecentUserPaymentModel(
      id: 2,
      name: 'Druv',
      secondName: 'maechel',
      profilePicture: 'https://i.pinimg.com/236x/86/e0/c7/86e0c7cf8cd0e96df1e5b66749790715.jpg',
    ),
    RecentUserPaymentModel(
      id: 2,
      name: 'Alice',
      secondName: 'Smith',
      profilePicture: 'https://st3.depositphotos.com/4071389/14851/i/450/depositphotos_148514169-stock-photo-handsome-shirtless-man.jpg',
    ),
  ];

}
