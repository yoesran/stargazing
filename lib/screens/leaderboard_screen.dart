// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:stargazing/models/users.dart';
import 'package:stargazing/on_boarding.dart';
import 'package:stargazing/services/user_services.dart';

class LeaderBoardScreen extends StatefulWidget {
  const LeaderBoardScreen({Key? key}) : super(key: key);

  @override
  _LeaderBoardScreenState createState() => _LeaderBoardScreenState();
}

class _LeaderBoardScreenState extends State<LeaderBoardScreen> {
  int i = 0, points = 0;
  @override
  Widget build(BuildContext context) {
    User? user = Provider.of<User?>(context);
    if (user == null) {
      Get.offAll(const OnBoarding());
    }

    return Scaffold(
      backgroundColor: const Color(0xFF312244),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Container(
            color: const Color(0xFF312244),
            child: Stack(
              children: [
                Lottie.asset("assets/lotties/sky.json"),
                Align(alignment: Alignment.topRight, child: Lottie.asset("assets/lotties/astronot.json", width: 100)),
                Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Papan Peringkat",
                      style: TextStyle(fontFamily: "NATS", color: Colors.white, fontSize: 24, fontWeight: FontWeight.normal),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    FutureBuilder(
                      future: UserServices.getUser(user!.uid),
                      builder: (_, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          Users data = snapshot.data as Users;

                          return SizedBox(
                            height: MediaQuery.of(context).size.height,
                            child: DefaultTabController(
                              length: 3,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TabBar(
                                      unselectedLabelColor: Colors.white,
                                      enableFeedback: false,
                                      indicatorSize: TabBarIndicatorSize.label,
                                      indicator:
                                          BoxDecoration(borderRadius: BorderRadius.circular(50), color: Colors.white.withOpacity(0.25)),
                                      tabs: const [
                                        Tab(
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Text("Level 1", style: TextStyle(fontSize: 13)),
                                          ),
                                        ),
                                        Tab(
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Text("Level 2", style: TextStyle(fontSize: 13)),
                                          ),
                                        ),
                                        Tab(
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Text("Level 3", style: TextStyle(fontSize: 13)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Flexible(
                                    fit: FlexFit.loose,
                                    child: TabBarView(
                                      physics: NeverScrollableScrollPhysics(),
                                      children: [
                                        levelLeaderboard(data, "level1points"),
                                        levelLeaderboard(data, "level2points"),
                                        levelLeaderboard(data, "level3points"),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        } else {
                          return const SpinKitFadingCircle(
                            color: Colors.white,
                            size: 50,
                          );
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding levelLeaderboard(Users data, String level) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 250.0, left: 18.0, right: 18.0),
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection("users")
            .where(level, isNotEqualTo: 0)
            .orderBy(level, descending: true)
            // .limit(50)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            i = 0;
            points = 0;
            if (snapshot.data!.docs.isEmpty) {
              return SizedBox();
            }
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    (snapshot.data!.docs.length >= 2) ? topThree(snapshot, data, 1) : SizedBox(),
                    (snapshot.data!.docs.length >= 1) ? topThree(snapshot, data, 0) : SizedBox(),
                    (snapshot.data!.docs.length >= 3) ? topThree(snapshot, data, 2) : SizedBox(),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Flexible(
                  fit: FlexFit.loose,
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      i++;
                      points = snapshot.data!.docs[index].get(level);
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.all(8.0),
                        margin: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: (data.id == snapshot.data!.docs[index].get("userID"))
                              ? Colors.white.withOpacity(0.05)
                              : (i == 1)
                                  ? Color(0xFF94B5C0)
                                  : (i == 2)
                                      ? Color(0xFFEE99A0)
                                      : (i == 3)
                                          ? Color(0xFFAD6C80)
                                          : Colors.transparent,
                          borderRadius: BorderRadius.circular(35),
                        ),
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              i.toString(),
                              style: TextStyle(
                                color: (data.id == snapshot.data!.docs[index].get("userID"))
                                    ? Colors.white
                                    : (i == 1 || i == 2 || i == 3)
                                        ? Colors.black
                                        : Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            (snapshot.data!.docs[index].get("profilePicture") == "")
                                ? const CircleAvatar(
                                    radius: 25,
                                    backgroundColor: Color(0xFF312244),
                                    child: Icon(
                                      Icons.person,
                                      color: Colors.white,
                                    ),
                                  )
                                : CircleAvatar(
                                    radius: 25,
                                    backgroundColor: const Color(0xFF312244),
                                    backgroundImage: NetworkImage(snapshot.data!.docs[index].get("profilePicture")),
                                    child: null,
                                  ),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              (data.id == snapshot.data!.docs[index].get("userID")) ? "Anda" : snapshot.data!.docs[index].get("name"),
                              style: TextStyle(
                                color: (data.id == snapshot.data!.docs[index].get("userID"))
                                    ? Colors.white
                                    : (i == 1 || i == 2 || i == 3)
                                        ? Colors.black
                                        : Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Spacer(),
                            Row(
                              children: [
                                Text(
                                  points.toString(),
                                  style: TextStyle(
                                    color: (data.id == snapshot.data!.docs[index].get("userID"))
                                        ? Colors.white
                                        : (i == 1 || i == 2 || i == 3)
                                            ? Colors.black.withOpacity(0.5)
                                            : Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  "pts",
                                  style: TextStyle(
                                    color: (data.id == snapshot.data!.docs[index].get("userID"))
                                        ? Colors.white
                                        : (i == 1 || i == 2 || i == 3)
                                            ? Colors.black.withOpacity(0.5)
                                            : Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          } else {
            return const SpinKitFadingCircle(
              color: Colors.white,
              size: 50,
            );
          }
        },
      ),
    );
  }

  Column topThree(AsyncSnapshot<QuerySnapshot<Object?>> snapshot, Users data, int rank) {
    return Column(
      children: [
        (snapshot.data!.docs[rank].get("profilePicture") == "")
            ? Stack(
                children: [
                  CircleAvatar(
                    radius: (rank == 0) ? 55 : 40,
                    backgroundColor: (rank == 2)
                        ? Color(0xFFAD6C80)
                        : (rank == 1)
                            ? Color(0xFFEE99A0)
                            : Color(0xFF94B5C0),
                    child: CircleAvatar(
                      radius: (rank == 0) ? 50 : 35,
                      backgroundColor: Color(0xFF312244),
                      child: Icon(
                        Icons.person,
                        size: (rank == 0) ? 50 : 35,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor: Color(0xFF312244),
                      child: CircleAvatar(
                        radius: 10,
                        backgroundColor: (rank == 2)
                            ? Color(0xFFAD6C80)
                            : (rank == 1)
                                ? Color(0xFFEE99A0)
                                : Color(0xFF94B5C0),
                        child: Text(
                          "${rank + 1}",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : Stack(
                children: [
                  CircleAvatar(
                    radius: (rank == 0) ? 55 : 40,
                    backgroundColor: Color(0xFFEE99A0),
                    child: CircleAvatar(
                      radius: (rank == 0) ? 50 : 35,
                      backgroundColor: const Color(0xFF312244),
                      backgroundImage: NetworkImage(snapshot.data!.docs[rank].get("profilePicture")),
                      child: null,
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor: Color(0xFF312244),
                      child: CircleAvatar(
                        radius: 10,
                        backgroundColor: Color(0xFFEE99A0),
                        child: Text(
                          "${rank + 1}",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
        SizedBox(
          height: 10,
        ),
        Text(
          (data.id == snapshot.data!.docs[rank].get("userID")) ? "Anda" : snapshot.data!.docs[rank].get("name"),
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
