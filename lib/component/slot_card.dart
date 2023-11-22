import 'package:flutter/material.dart';

class SlotCard extends StatelessWidget {
  final List users;
  final String numSlot;
  final String hour;
  const SlotCard(
      {Key? key,
      required this.users,
      required this.numSlot,
      required this.hour})
      : super(key: key);

  final maxUsers = 6;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xff3a3a3a),
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    this.numSlot,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    this.hour,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Expanded(
                    child: GridView.count(
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      mainAxisSpacing: 0,
                      crossAxisSpacing: 0,
                      childAspectRatio: 4, // mengatur rasio aspek item grid
                      children: users.map((item) {
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '\u2022',
                              style: TextStyle(
                                  fontSize: 10,
                                  height: 1.55,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: Container(
                                child: Text(
                                  item,
                                  textAlign: TextAlign.left,
                                  softWrap: true,
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.white,
                                    height: 1.55,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      }).toList(),
                    ),
                  ),
                  // Text(
                  //   "1. Lado",
                  //   style: TextStyle(
                  //     color: Colors.white,
                  //     fontWeight: FontWeight.w300,
                  //     fontSize: 8,
                  //   ),
                  // ),
                  // Text(
                  //   "2. Rayhan",
                  //   style: TextStyle(
                  //     color: Colors.white,
                  //     fontWeight: FontWeight.w300,
                  //     fontSize: 8,
                  //   ),
                  // ),
                  // Text(
                  //   "3. Najib",
                  //   style: TextStyle(
                  //     color: Colors.white,
                  //     fontWeight: FontWeight.w300,
                  //     fontSize: 8,
                  //   ),
                  // ),
                  // Text(
                  //   "1. Lado",
                  //   style: TextStyle(
                  //     color: Colors.white,
                  //     fontWeight: FontWeight.w300,
                  //     fontSize: 8,
                  //   ),
                  // ),
                  // Text(
                  //   "2. Rayhan",
                  //   style: TextStyle(
                  //     color: Colors.white,
                  //     fontWeight: FontWeight.w300,
                  //     fontSize: 8,
                  //   ),
                  // ),
                  // Text(
                  //   "3. Najib",
                  //   style: TextStyle(
                  //     color: Colors.white,
                  //     fontWeight: FontWeight.w300,
                  //     fontSize: 8,
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.all(0),
            color: this.users.length < maxUsers
                ? Color(0xff689C6D)
                : Color(0xff9C6868),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
            ),
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return SizedBox(
                  height: 40,
                  width: constraints.maxWidth,
                  child: Center(
                    child: Text(
                      this.users.length < maxUsers ? 'AVAILABLE' : 'FULL',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
