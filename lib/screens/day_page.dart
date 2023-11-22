import 'package:flutter/material.dart';
import 'package:houseofedgegym/component/slot_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _firestore = FirebaseFirestore.instance;

class DaySlot extends StatefulWidget {
  final String day;
  final String img;

  DaySlot({Key? key, required this.day, required this.img}) : super(key: key);

  @override
  State<DaySlot> createState() => _DaySlotState();
}

class _DaySlotState extends State<DaySlot> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/${widget.img}.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                color: Colors.transparent,
                child: SafeArea(
                  bottom: false,
                  child: Column(
                    children: <Widget>[
                      AppBar(
                        elevation: 0.0,
                        leading: IconButton(
                          icon: const Icon(Icons.arrow_back),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                        backgroundColor: Colors.transparent,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 30),
                color: Colors.transparent,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min, // tambahkan baris ini
                  children: <Widget>[
                    Text(
                      widget.day,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xffffffff),
                        decoration: TextDecoration.none,
                        fontSize: 24,
                      ),
                    ),
                    SlotStreams(
                      day: widget.day.toLowerCase(),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SlotStreams extends StatelessWidget {
  final String day;

  const SlotStreams({Key? key, required this.day}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('schedule').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        }
        final schedules = snapshot.data?.docs;
        final List<SlotCard> slotCards = [];
        for (var slots in schedules!) {
          if (!slots.data().toString().contains(day.toLowerCase())) {
            continue;
          }
          final daySlot = slots[day.toLowerCase()];
          final slotList = daySlot['data'];
          for (var slot in slotList) {
            final numSlot = slot['num'];
            final hourSlot = slot['hour'];
            final users = slot['users'];

            final slotCard = SlotCard(
              users: users,
              numSlot: numSlot,
              hour: hourSlot,
            );
            slotCards.add(slotCard);
          }
          break;
        }
        return GridView.count(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true, // tambahkan baris ini
          crossAxisCount: 2,
          children: slotCards,
        );
      },
    );
  }
}
