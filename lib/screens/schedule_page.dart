import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:houseofedgegym/component/schedule_card.dart';
import 'package:houseofedgegym/screens/day_page.dart';

class Schedule extends StatelessWidget {
  const Schedule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff181818),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              color: const Color(0xff181818),
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
                      backgroundColor: const Color(0xff181818),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 30),
              color: const Color(0xff181818),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'House of Edge Gym',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xffffffff),
                      decoration: TextDecoration.none,
                      fontSize: 24,
                    ),
                  ),
                  const Text(
                    'Your Favorite Private Gym',
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      color: Color(0xffADADAD),
                      decoration: TextDecoration.none,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(
                    width: double.infinity,
                    height: 20,
                  ),
                  ScheduleCard(
                    label: 'MONDAY',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DaySlot(day: 'Monday', img: 'monday'),
                        ),
                      );
                    },
                    img: 'monday',
                  ),
                  ScheduleCard(
                    label: 'TUESDAY',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DaySlot(day: 'Tuesday', img: 'tuesday'),
                        ),
                      );
                    },
                    img: 'tuesday',
                  ),
                  ScheduleCard(
                    label: 'WEDNESDAY',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DaySlot(day: 'Wednesday', img: 'wednesday'),
                        ),
                      );
                    },
                    img: 'wednesday',
                  ),
                  ScheduleCard(
                    label: 'THURSDAY',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DaySlot(day: 'Thursday', img: 'thursday'),
                        ),
                      );
                    },
                    img: 'thursday',
                  ),
                  ScheduleCard(
                    label: 'FRIDAY',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DaySlot(day: 'Friday', img: 'friday'),
                        ),
                      );
                    },
                    img: 'friday',
                  ),
                  ScheduleCard(
                    label: 'SATURDAY',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DaySlot(day: 'Saturday', img: 'saturday'),
                        ),
                      );
                    },
                    img: 'saturday',
                  ),
                  ScheduleCard(
                    label: 'SUNDAY',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DaySlot(day: 'Sunday', img: 'sunday'),
                        ),
                      );
                    },
                    img: 'sunday',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
