import 'package:get/get.dart';
import 'package:payment_management_app/models/activity_model/activity_model.dart';
import 'package:payment_management_app/services/local_database/activity_db_helper.dart';

class ActivityDatabaseController extends GetxController {
  late ActivityDatabaseHelper _activityDatabaseHelper;
  RxList<ActivityModel> activity = <ActivityModel>[].obs;

  @override
  void onInit() {
    _activityDatabaseHelper = ActivityDatabaseHelper();

    _insertInitialActivities();
    refreshActivity();
    super.onInit();
  }

  Future<void> _insertInitialActivities() async {
    try {
      for (var activity in initialActivity) {
        await _activityDatabaseHelper.insertActivity(activity);
      }
    } catch (e) {
      // ignore: avoid_print
      print('Error inserting users: $e');
    }
  }

  Future<void> refreshActivity() async {
    final activityList = await _activityDatabaseHelper.getActivity();
    activity.assignAll(activityList);
  }

  final List<ActivityModel> initialActivity = [
    ActivityModel(
      id: 1,
      product: 'Apple Macbook Pro 16 - Silver',
      company: 'Apple Store',
      returnMessage:'Return Time Remaining 2 Weeks',
      price: 3234.03,
      address: '1321, Colorado Street, Suit 32 - 90876'
    ),
    ActivityModel(
      id: 2,
       product: 'Ueno Coffee Filters',
        company: 'Target',
        returnMessage: 'Return Time Remaining 2 Weeks',
        price: 3234.03,
        address: '1321, Colorado Street, Suit 32 - 90876'
        ),
   
  ];
}
