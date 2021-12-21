import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:stargazing/on_boarding.dart';

import 'models/users.dart';
import 'user_services.dart';

class LeaderBoard extends StatefulWidget {
  const LeaderBoard({Key? key}) : super(key: key);

  @override
  _LeaderBoardState createState() => _LeaderBoardState();
}

class _LeaderBoardState extends State<LeaderBoard> {
  int i = 0, points = 0;
  @override
  Widget build(BuildContext context) {
    User? user = Provider.of<User?>(context);

    return Scaffold(
      backgroundColor: const Color(0xFF312244),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Container(
            color: const Color(0xFF312244),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Leaderboard",
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
                      if (user == null) {
                        Get.offAll(OnBoarding());
                      }
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
                                  indicator: BoxDecoration(borderRadius: BorderRadius.circular(50), color: Colors.white.withOpacity(0.25)),
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
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 250.0, left: 18.0, right: 18.0),
                                      child: StreamBuilder<QuerySnapshot>(
                                        stream: FirebaseFirestore.instance
                                            .collection("users")
                                            .where('level1points', isNotEqualTo: 0)
                                            .orderBy('level1points', descending: true)
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
                                                    (snapshot.data!.docs.length >= 2)
                                                        ? Column(
                                                            children: [
                                                              (snapshot.data!.docs[1].get("profilePicture") == "")
                                                                  ? Stack(
                                                                      children: [
                                                                        CircleAvatar(
                                                                          radius: 45,
                                                                          backgroundColor: Color(0xFFEE99A0),
                                                                          child: CircleAvatar(
                                                                            radius: 40,
                                                                            backgroundColor: const Color(0xFF312244),
                                                                            child: Icon(
                                                                              Icons.person,
                                                                              size: 40,
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
                                                                              backgroundColor: Color(0xFFEE99A0),
                                                                              child: Text(
                                                                                "2",
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
                                                                          radius: 45,
                                                                          backgroundColor: Color(0xFFEE99A0),
                                                                          child: CircleAvatar(
                                                                            radius: 40,
                                                                            backgroundColor: const Color(0xFF312244),
                                                                            backgroundImage:
                                                                                NetworkImage(snapshot.data!.docs[1].get("profilePicture")),
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
                                                                                "2",
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
                                                                (data.id == snapshot.data!.docs[1].get("userID"))
                                                                    ? "You"
                                                                    : snapshot.data!.docs[1].get("name"),
                                                                style: TextStyle(
                                                                  color: Colors.white,
                                                                  fontSize: 16,
                                                                  fontWeight: FontWeight.w500,
                                                                ),
                                                              ),
                                                            ],
                                                          )
                                                        : SizedBox(),
                                                    (snapshot.data!.docs.length >= 1)
                                                        ? Column(
                                                            children: [
                                                              (snapshot.data!.docs[0].get("profilePicture") == "")
                                                                  ? Stack(
                                                                      children: [
                                                                        CircleAvatar(
                                                                          radius: 65,
                                                                          backgroundColor: Color(0xFF94B5C0),
                                                                          child: CircleAvatar(
                                                                            radius: 60,
                                                                            backgroundColor: const Color(0xFF312244),
                                                                            child: Icon(
                                                                              Icons.person,
                                                                              size: 50,
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
                                                                              backgroundColor: Color(0xFF94B5C0),
                                                                              child: Text(
                                                                                "1",
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
                                                                          radius: 65,
                                                                          backgroundColor: Color(0xFF94B5C0),
                                                                          child: CircleAvatar(
                                                                            radius: 60,
                                                                            backgroundColor: const Color(0xFF312244),
                                                                            backgroundImage:
                                                                                NetworkImage(snapshot.data!.docs[0].get("profilePicture")),
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
                                                                              backgroundColor: Color(0xFF94B5C0),
                                                                              child: Text(
                                                                                "1",
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
                                                                (data.id == snapshot.data!.docs[0].get("userID"))
                                                                    ? "You"
                                                                    : snapshot.data!.docs[0].get("name"),
                                                                style: TextStyle(
                                                                  color: Colors.white,
                                                                  fontSize: 16,
                                                                  fontWeight: FontWeight.w500,
                                                                ),
                                                              ),
                                                            ],
                                                          )
                                                        : SizedBox(),
                                                    (snapshot.data!.docs.length >= 3)
                                                        ? Column(
                                                            children: [
                                                              (snapshot.data!.docs[2].get("profilePicture") == "")
                                                                  ? Stack(
                                                                      children: [
                                                                        CircleAvatar(
                                                                          radius: 45,
                                                                          backgroundColor: Color(0xFFD17B96),
                                                                          child: CircleAvatar(
                                                                            radius: 40,
                                                                            backgroundColor: const Color(0xFF312244),
                                                                            child: Icon(
                                                                              Icons.person,
                                                                              size: 40,
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
                                                                              backgroundColor: Color(0xFFD17B96),
                                                                              child: Text(
                                                                                "3",
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
                                                                          radius: 45,
                                                                          backgroundColor: Color(0xFFD17B96),
                                                                          child: CircleAvatar(
                                                                            radius: 40,
                                                                            backgroundColor: const Color(0xFFD17B96),
                                                                            backgroundImage:
                                                                                NetworkImage(snapshot.data!.docs[2].get("profilePicture")),
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
                                                                              backgroundColor: Color(0xFFD17B96),
                                                                              child: Text(
                                                                                "3",
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
                                                                (data.id == snapshot.data!.docs[2].get("userID"))
                                                                    ? "You"
                                                                    : snapshot.data!.docs[2].get("name"),
                                                                style: TextStyle(
                                                                  color: Colors.white,
                                                                  fontSize: 16,
                                                                  fontWeight: FontWeight.w500,
                                                                ),
                                                              ),
                                                            ],
                                                          )
                                                        : SizedBox(),
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
                                                      points = snapshot.data!.docs[index].get("level2points");
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
                                                            SizedBox(
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
                                                            SizedBox(
                                                              width: 20,
                                                            ),
                                                            (snapshot.data!.docs[index].get("profilePicture") == "")
                                                                ? CircleAvatar(
                                                                    radius: 25,
                                                                    backgroundColor: const Color(0xFF312244),
                                                                    child: Icon(
                                                                      Icons.person,
                                                                      color: Colors.white,
                                                                    ))
                                                                : CircleAvatar(
                                                                    radius: 25,
                                                                    backgroundColor: const Color(0xFF312244),
                                                                    backgroundImage:
                                                                        NetworkImage(snapshot.data!.docs[index].get("profilePicture")),
                                                                    child: null,
                                                                  ),
                                                            SizedBox(
                                                              width: 20,
                                                            ),
                                                            Text(
                                                              (data.id == snapshot.data!.docs[index].get("userID"))
                                                                  ? "You"
                                                                  : snapshot.data!.docs[index].get("name"),
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
                                                            SizedBox(
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
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 250.0, left: 18.0, right: 18.0),
                                      child: StreamBuilder<QuerySnapshot>(
                                        stream: FirebaseFirestore.instance
                                            .collection("users")
                                            .where('level2points', isNotEqualTo: 0)
                                            .orderBy('level2points', descending: true)
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
                                                    (snapshot.data!.docs.length >= 2)
                                                        ? Column(
                                                            children: [
                                                              (snapshot.data!.docs[1].get("profilePicture") == "")
                                                                  ? Stack(
                                                                      children: [
                                                                        CircleAvatar(
                                                                          radius: 45,
                                                                          backgroundColor: Color(0xFFEE99A0),
                                                                          child: CircleAvatar(
                                                                            radius: 40,
                                                                            backgroundColor: const Color(0xFF312244),
                                                                            child: Icon(
                                                                              Icons.person,
                                                                              size: 40,
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
                                                                              backgroundColor: Color(0xFFEE99A0),
                                                                              child: Text(
                                                                                "2",
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
                                                                          radius: 45,
                                                                          backgroundColor: Color(0xFFEE99A0),
                                                                          child: CircleAvatar(
                                                                            radius: 40,
                                                                            backgroundColor: const Color(0xFF312244),
                                                                            backgroundImage:
                                                                                NetworkImage(snapshot.data!.docs[1].get("profilePicture")),
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
                                                                                "2",
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
                                                                (data.id == snapshot.data!.docs[1].get("userID"))
                                                                    ? "You"
                                                                    : snapshot.data!.docs[1].get("name"),
                                                                style: TextStyle(
                                                                  color: Colors.white,
                                                                  fontSize: 16,
                                                                  fontWeight: FontWeight.w500,
                                                                ),
                                                              ),
                                                            ],
                                                          )
                                                        : SizedBox(),
                                                    (snapshot.data!.docs.length >= 1)
                                                        ? Column(
                                                            children: [
                                                              (snapshot.data!.docs[0].get("profilePicture") == "")
                                                                  ? Stack(
                                                                      children: [
                                                                        CircleAvatar(
                                                                          radius: 65,
                                                                          backgroundColor: Color(0xFF94B5C0),
                                                                          child: CircleAvatar(
                                                                            radius: 60,
                                                                            backgroundColor: const Color(0xFF312244),
                                                                            child: Icon(
                                                                              Icons.person,
                                                                              size: 50,
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
                                                                              backgroundColor: Color(0xFF94B5C0),
                                                                              child: Text(
                                                                                "1",
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
                                                                          radius: 65,
                                                                          backgroundColor: Color(0xFF94B5C0),
                                                                          child: CircleAvatar(
                                                                            radius: 60,
                                                                            backgroundColor: const Color(0xFF312244),
                                                                            backgroundImage:
                                                                                NetworkImage(snapshot.data!.docs[0].get("profilePicture")),
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
                                                                              backgroundColor: Color(0xFF94B5C0),
                                                                              child: Text(
                                                                                "1",
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
                                                                (data.id == snapshot.data!.docs[0].get("userID"))
                                                                    ? "You"
                                                                    : snapshot.data!.docs[0].get("name"),
                                                                style: TextStyle(
                                                                  color: Colors.white,
                                                                  fontSize: 16,
                                                                  fontWeight: FontWeight.w500,
                                                                ),
                                                              ),
                                                            ],
                                                          )
                                                        : SizedBox(),
                                                    (snapshot.data!.docs.length >= 3)
                                                        ? Column(
                                                            children: [
                                                              (snapshot.data!.docs[2].get("profilePicture") == "")
                                                                  ? Stack(
                                                                      children: [
                                                                        CircleAvatar(
                                                                          radius: 45,
                                                                          backgroundColor: Color(0xFFD17B96),
                                                                          child: CircleAvatar(
                                                                            radius: 40,
                                                                            backgroundColor: const Color(0xFF312244),
                                                                            child: Icon(
                                                                              Icons.person,
                                                                              size: 40,
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
                                                                              backgroundColor: Color(0xFFD17B96),
                                                                              child: Text(
                                                                                "3",
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
                                                                          radius: 45,
                                                                          backgroundColor: Color(0xFFD17B96),
                                                                          child: CircleAvatar(
                                                                            radius: 40,
                                                                            backgroundColor: const Color(0xFFD17B96),
                                                                            backgroundImage:
                                                                                NetworkImage(snapshot.data!.docs[2].get("profilePicture")),
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
                                                                              backgroundColor: Color(0xFFD17B96),
                                                                              child: Text(
                                                                                "3",
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
                                                                (data.id == snapshot.data!.docs[2].get("userID"))
                                                                    ? "You"
                                                                    : snapshot.data!.docs[2].get("name"),
                                                                style: TextStyle(
                                                                  color: Colors.white,
                                                                  fontSize: 16,
                                                                  fontWeight: FontWeight.w500,
                                                                ),
                                                              ),
                                                            ],
                                                          )
                                                        : SizedBox(),
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
                                                      points = snapshot.data!.docs[index].get("level2points");
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
                                                            SizedBox(
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
                                                            SizedBox(
                                                              width: 20,
                                                            ),
                                                            (snapshot.data!.docs[index].get("profilePicture") == "")
                                                                ? CircleAvatar(
                                                                    radius: 25,
                                                                    backgroundColor: const Color(0xFF312244),
                                                                    child: Icon(
                                                                      Icons.person,
                                                                      color: Colors.white,
                                                                    ))
                                                                : CircleAvatar(
                                                                    radius: 25,
                                                                    backgroundColor: const Color(0xFF312244),
                                                                    backgroundImage:
                                                                        NetworkImage(snapshot.data!.docs[index].get("profilePicture")),
                                                                    child: null,
                                                                  ),
                                                            SizedBox(
                                                              width: 20,
                                                            ),
                                                            Text(
                                                              (data.id == snapshot.data!.docs[index].get("userID"))
                                                                  ? "You"
                                                                  : snapshot.data!.docs[index].get("name"),
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
                                                            SizedBox(
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
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 250.0, left: 18.0, right: 18.0),
                                      child: StreamBuilder<QuerySnapshot>(
                                        stream: FirebaseFirestore.instance
                                            .collection("users")
                                            .where('level3points', isNotEqualTo: 0)
                                            .orderBy('level3points', descending: true)
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
                                                    (snapshot.data!.docs.length >= 2)
                                                        ? Column(
                                                            children: [
                                                              (snapshot.data!.docs[1].get("profilePicture") == "")
                                                                  ? Stack(
                                                                      children: [
                                                                        CircleAvatar(
                                                                          radius: 45,
                                                                          backgroundColor: Color(0xFFEE99A0),
                                                                          child: CircleAvatar(
                                                                            radius: 40,
                                                                            backgroundColor: const Color(0xFF312244),
                                                                            child: Icon(
                                                                              Icons.person,
                                                                              size: 40,
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
                                                                              backgroundColor: Color(0xFFEE99A0),
                                                                              child: Text(
                                                                                "2",
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
                                                                          radius: 45,
                                                                          backgroundColor: Color(0xFFEE99A0),
                                                                          child: CircleAvatar(
                                                                            radius: 40,
                                                                            backgroundColor: const Color(0xFF312244),
                                                                            backgroundImage:
                                                                                NetworkImage(snapshot.data!.docs[1].get("profilePicture")),
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
                                                                                "2",
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
                                                                (data.id == snapshot.data!.docs[1].get("userID"))
                                                                    ? "You"
                                                                    : snapshot.data!.docs[1].get("name"),
                                                                style: TextStyle(
                                                                  color: Colors.white,
                                                                  fontSize: 16,
                                                                  fontWeight: FontWeight.w500,
                                                                ),
                                                              ),
                                                            ],
                                                          )
                                                        : SizedBox(),
                                                    (snapshot.data!.docs.length >= 1)
                                                        ? Column(
                                                            children: [
                                                              (snapshot.data!.docs[0].get("profilePicture") == "")
                                                                  ? Stack(
                                                                      children: [
                                                                        CircleAvatar(
                                                                          radius: 65,
                                                                          backgroundColor: Color(0xFF94B5C0),
                                                                          child: CircleAvatar(
                                                                            radius: 60,
                                                                            backgroundColor: const Color(0xFF312244),
                                                                            child: Icon(
                                                                              Icons.person,
                                                                              size: 50,
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
                                                                              backgroundColor: Color(0xFF94B5C0),
                                                                              child: Text(
                                                                                "1",
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
                                                                          radius: 65,
                                                                          backgroundColor: Color(0xFF94B5C0),
                                                                          child: CircleAvatar(
                                                                            radius: 60,
                                                                            backgroundColor: const Color(0xFF312244),
                                                                            backgroundImage:
                                                                                NetworkImage(snapshot.data!.docs[0].get("profilePicture")),
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
                                                                              backgroundColor: Color(0xFF94B5C0),
                                                                              child: Text(
                                                                                "1",
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
                                                                (data.id == snapshot.data!.docs[0].get("userID"))
                                                                    ? "You"
                                                                    : snapshot.data!.docs[0].get("name"),
                                                                style: TextStyle(
                                                                  color: Colors.white,
                                                                  fontSize: 16,
                                                                  fontWeight: FontWeight.w500,
                                                                ),
                                                              ),
                                                            ],
                                                          )
                                                        : SizedBox(),
                                                    (snapshot.data!.docs.length >= 3)
                                                        ? Column(
                                                            children: [
                                                              (snapshot.data!.docs[2].get("profilePicture") == "")
                                                                  ? Stack(
                                                                      children: [
                                                                        CircleAvatar(
                                                                          radius: 45,
                                                                          backgroundColor: Color(0xFFD17B96),
                                                                          child: CircleAvatar(
                                                                            radius: 40,
                                                                            backgroundColor: const Color(0xFF312244),
                                                                            child: Icon(
                                                                              Icons.person,
                                                                              size: 40,
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
                                                                              backgroundColor: Color(0xFFD17B96),
                                                                              child: Text(
                                                                                "3",
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
                                                                          radius: 45,
                                                                          backgroundColor: Color(0xFFD17B96),
                                                                          child: CircleAvatar(
                                                                            radius: 40,
                                                                            backgroundColor: const Color(0xFFD17B96),
                                                                            backgroundImage:
                                                                                NetworkImage(snapshot.data!.docs[2].get("profilePicture")),
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
                                                                              backgroundColor: Color(0xFFD17B96),
                                                                              child: Text(
                                                                                "3",
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
                                                                (data.id == snapshot.data!.docs[2].get("userID"))
                                                                    ? "You"
                                                                    : snapshot.data!.docs[2].get("name"),
                                                                style: TextStyle(
                                                                  color: Colors.white,
                                                                  fontSize: 16,
                                                                  fontWeight: FontWeight.w500,
                                                                ),
                                                              ),
                                                            ],
                                                          )
                                                        : SizedBox(),
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
                                                      points = snapshot.data!.docs[index].get("level2points");
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
                                                            SizedBox(
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
                                                            SizedBox(
                                                              width: 20,
                                                            ),
                                                            (snapshot.data!.docs[index].get("profilePicture") == "")
                                                                ? CircleAvatar(
                                                                    radius: 25,
                                                                    backgroundColor: const Color(0xFF312244),
                                                                    child: Icon(
                                                                      Icons.person,
                                                                      color: Colors.white,
                                                                    ))
                                                                : CircleAvatar(
                                                                    radius: 25,
                                                                    backgroundColor: const Color(0xFF312244),
                                                                    backgroundImage:
                                                                        NetworkImage(snapshot.data!.docs[index].get("profilePicture")),
                                                                    child: null,
                                                                  ),
                                                            SizedBox(
                                                              width: 20,
                                                            ),
                                                            Text(
                                                              (data.id == snapshot.data!.docs[index].get("userID"))
                                                                  ? "You"
                                                                  : snapshot.data!.docs[index].get("name"),
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
                                                            SizedBox(
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
                                    ),
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
          ),
        ),
      ),
    );
  }
}
