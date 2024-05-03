import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payment_management_app/controllers/user/user_db_controller.dart';
import 'package:payment_management_app/utils/constants.dart';

class TopBarWidget extends GetView<UserDatabaseController> {
  @override
  final UserDatabaseController controller = Get.put(UserDatabaseController());

  TopBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.user.isNotEmpty) {
        final user = controller.user[0];
        return Row(
          children: [
            kwidth10,
            CircleAvatar(
              radius: 37,
              backgroundColor: kwhite,
              child: CircleAvatar(
                radius: 33,
                backgroundImage: NetworkImage(user.profilePicture),
              ),
            ),
            kwidth10,
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hi,${user.name}',
                  style: textstyle3,
                ),
                Text(
                  'Here\'s your spending dashboard',
                  style: textstyle4,
                )
              ],
            ),
            kwidth30,
            Stack(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.notifications,
                    size: 28,
                    color: Colors.grey,
                  ),
                ),
                Positioned(
                  right: 8,
                  top: 0,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: const Text(
                      '2',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      } else {
        return const CircularProgressIndicator();
      }
    });
  }
}

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:payment_management_app/controllers/user/user_db_controller.dart';
// import 'package:payment_management_app/models/user/user_model.dart';
// import 'package:payment_management_app/utils/constants.dart';

// class TopBarWidget extends StatelessWidget {
//   TopBarWidget({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<UserDatabaseController>(
//       init: UserDatabaseController(), // Initialize the controller
//       builder: (userController) {
//         return FutureBuilder<UserModel?>(
//           future: userController.getUserById(1),
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return CircularProgressIndicator();
//             } else if (snapshot.hasError) {
//               return Text('Error: ${snapshot.error}');
//             } else {
//               UserModel? user = snapshot.data;

//               return Row(
//                 children: [
//                   SizedBox(width: 10),
//                   CircleAvatar(
//                     radius: 37,
//                     backgroundColor: Colors.white,
//                     backgroundImage: NetworkImage(user?.profilePicture ?? ''),
//                   ),
//                   SizedBox(width: 10),
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Hi, ${user?.name ?? ''}',
//                         style: textstyle3,
//                       ),
//                       Text(
//                         "Here's your spending dashboard",
//                         style: textstyle4,
//                       ),
//                       Text(
//                         'Mail ID: ${user?.mailId ?? ''}',
//                         style: TextStyle(fontSize: 14),
//                       ),
//                       Text(
//                         'Balance: \$${user?.balance.toStringAsFixed(2) ?? ''}',
//                         style: TextStyle(fontSize: 14),
//                       ),
//                     ],
//                   ),
//                   SizedBox(width: 30),
//                   Stack(
//                     children: [
//                       IconButton(
//                         onPressed: () {},
//                         icon: Icon(
//                           Icons.notifications,
//                           size: 28,
//                           color: Colors.grey,
//                         ),
//                       ),
//                       Positioned(
//                         right: 8,
//                         top: 0,
//                         child: Container(
//                           padding: EdgeInsets.all(4),
//                           decoration: BoxDecoration(
//                             color: Colors.red,
//                             shape: BoxShape.circle,
//                           ),
//                           child: Text(
//                             '2',
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               );
//             }
//           },
//         );
//       },
//     );
//   }
// }
