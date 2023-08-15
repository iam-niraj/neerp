import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 40,
                ),
                Stack(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        height: 80,
                        width: 250,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(50),
                            topRight: Radius.circular(50),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: 40.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Dashboard",
                                style: TextStyle(
                                    fontSize:
                                        30) /* Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Poppins"), */
                                ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Item(
                      icon: 'images/lift.svg',
                      title: "Add Lift",
                    ),
                    Item(
                      icon: "images/add_user.svg",
                      title: "Add User",
                    ),
                    Item(
                      icon: "images/lift.svg",
                      title: "Lift List",
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Item(
                      icon: 'images/job.svg',
                      icon2: 'images/timer.svg',
                      title: "Ongoing Activities",
                    ),
                    Item(
                      icon: "images/job.svg",
                      icon2: 'images/assign.svg',
                      title: "Assign Activities",
                    ),
                    Item(
                      icon: "images/job.svg",
                      icon2: 'images/completed.svg',
                      title: "Completed Activities",
                    ),
                  ],
                ),
                /* Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Flexible(
                        flex: 2,
                        child: Container(
                          color: Colors.red,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              AspectRatio(
                                aspectRatio: 1,
                                child: SvgPicture.asset(
                                  "images/job.svg",
                                ),
                              ),
                              Text(
                                "Ongoing Activity",
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      Flexible(
                        flex: 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Stack(
                              children: [
                                AspectRatio(
                                  aspectRatio: 1,
                                  child: SvgPicture.asset(
                                    "images/job.svg",
                                  ),
                                ),
                                Positioned.fill(
                                  left: 50,
                                  child: SvgPicture.asset(
                                    "images/completed.svg",
                                    height: 30,
                                    width: 30,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              "Completed Activity",
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      Flexible(
                        flex: 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Stack(
                              children: [
                                AspectRatio(
                                  aspectRatio: 1,
                                  child: SvgPicture.asset(
                                    "images/job.svg",
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  left: 0,
                                  child: SvgPicture.asset(
                                    "images/assign.svg",
                                    height: 30,
                                    width: 30,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              "Assign Activity",
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ), */
                /* Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Flexible(
                        child: Container(
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: SvgPicture.asset(
                              "images/job.svg",
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ), */

                /* Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Flexible(
                        child: Container(
                      child: Column(
                        children: [
                          Image.asset("images/job.png"),
                          Text("Add Lift")
                        ],
                      ),
                    )),
                    Flexible(
                        child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Image.asset("images/job.png"),
                          Text("Add Lift")
                        ],
                      ),
                    )),
                    Flexible(
                        child: Container(
                      child: Column(
                        children: [
                          Image.asset("images/job.png"),
                          Text("Add Lift")
                        ],
                      ),
                    )),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Flexible(
                        child: Container(
                      child: Column(
                        children: [
                          Image.asset("images/user_list.png"),
                          Text("Add Lift")
                        ],
                      ),
                    ),),
                  ],
                ), */
                /* SizedBox(
                  height: 4.0.hp,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    DashboardSet2(
                      iconHeight: iconHeight / 2,
                      iconWidth: iconWidth / 2,
                      icon: "assets/images/ongoing.png",
                      title1: 'Pending',
                      title2: 'Activity',
                    ),
                    DashboardSet2(
                      iconHeight: iconHeight / 2,
                      iconWidth: iconWidth / 2,
                      icon: "assets/images/completed.png",
                      title1: 'Completed',
                      title2: 'Activity',
                    ),
                    DashboardSet2(
                      iconHeight: iconHeight / 2,
                      iconWidth: iconWidth / 2,
                      icon: "assets/images/assign_icon.png",
                      title1: 'Assign',
                      title2: 'Activity',
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.0.hp,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 2.0.wp),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      UserSet(
                        iconHeight: iconHeight / 2,
                        iconWidth: iconWidth / 2,
                        icon: "assets/images/users.png",
                        title: "User List",
                        icon2: "assets/images/list.png",
                      ),
                    ],
                  ),
                ) */
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Item extends StatelessWidget {
  Item({required this.icon, required this.title, this.icon2});

  final String icon;
  final String? icon2;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: SvgPicture.asset(
                    icon,
                  ),
                ),
                Text(
                  title,
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
          icon2 != null
              ? Positioned(
                  bottom: 60,
                  left: 10,
                  child: SvgPicture.asset(
                    icon2!,
                    height: 30,
                    width: 30,
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}
