// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:houseofedgegym/component/slot_card.dart';
//
// final _firestore = FirebaseFirestore.instance;
//
// class SlotStreams extends StatelessWidget {
//   final String day;
//
//   const SlotStreams({Key? key, required this.day}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<QuerySnapshot>(
//       stream: _firestore.collection('schedule').snapshots(),
//       builder: (context, snapshot) {
//         if (!snapshot.hasData) {
//           return Center(
//             child: CircularProgressIndicator(
//               backgroundColor: Colors.lightBlueAccent,
//             ),
//           );
//         }
//         final schedules = snapshot.data?.docs;
//         final List<SlotCard> slotCards = [];
//         for (var slots in schedules!) {
//           final daySlot = slots[day.toLowerCase()];
//           final slotList = daySlot['data'];
//           for (var slot in slotList) {
//             final numSlot = slot['num'];
//             final hourSlot = slot['hour'];
//             final users = slot['users'];
//
//             final slotCard = SlotCard(
//               users: users,
//               numSlot: numSlot,
//               hour: hourSlot,
//             );
//             slotCards.add(slotCard);
//           }
//           break;
//         }
//         return GridView.count(
//           shrinkWrap: true,
//           crossAxisCount: 2,
//           children: slotCards,
//         );
//       },
//     );
//   }
// }
