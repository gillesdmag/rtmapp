// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:rtmapp1/common/controle_screen.dart';
// import 'package:rtmapp1/common/navigation_drawer.dart';
// import 'package:rtmapp1/models/user.dart';

// import 'login_screen.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   User? user = FirebaseAuth.instance.currentUser;
//   AppUserData loggedInUser = AppUserData();

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();

//     FirebaseFirestore.instance
//         .collection("Users")
//         .doc(user!.uid)
//         .get()
//         .then((value) {
//       this.loggedInUser = AppUserData.fromMap(value.data());
//       setState(() {});
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: NavigationDrawer(),
//       appBar: AppBar(
//         title: Text("Home"),
//         centerTitle: true,
//       ),
//       body: Center(
//         child: Padding(
//           padding: EdgeInsets.all(36),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: <Widget>[
//               SizedBox(
//                 height: 180,
//                 child: Image.asset(
//                   "assets/logo3.png",
//                   fit: BoxFit.contain,
//                 ),
//               ),
//               Text(
//                 "Welcome back",
//                 style: TextStyle(fontSize: 15),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Text(
//                 "${loggedInUser.name}",
//                 style: TextStyle(fontSize: 15, color: Colors.black),
//               ),
//               Text(
//                 "${loggedInUser.email}",
//                 style: TextStyle(fontSize: 15, color: Colors.black),
//               ),
//               SizedBox(
//                 height: 15,
//               ),
//               ActionChip(
//                 backgroundColor: Colors.redAccent,
//                 label: Text(
//                   "Logout",
//                   style: TextStyle(
//                       fontSize: 15,
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold),
//                 ),
//                 onPressed: () {
//                   logout(context);
//                   // Navigator.push(context,
//                   //     MaterialPageRoute(builder: (context) => LoginScreen()));
//                 },
//               )
//             ],
//           ),
//         ),
//       ),
//       // bottomNavigationBar: ControleScreen(),
//     );
//   }

//   Future<void> logout(BuildContext context) async {
//     await FirebaseAuth.instance.signOut();
//     Navigator.of(context).pushReplacement(
//         MaterialPageRoute(builder: (context) => LoginScreen()));
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:rtmapp1/common/customclipper.dart';
import 'package:rtmapp1/common/navigation_drawer.dart';
import 'package:rtmapp1/models/intrusion_model.dart';
import 'package:rtmapp1/models/user.dart';
import 'package:rtmapp1/screens/infoIntrusion.dart';
import 'package:rtmapp1/screens/login_screen.dart';
import 'package:rtmapp1/screens/profil_screen.dart';
// import 'package:rtmapp1/models/task_model.dart';
// import 'package:rtmapp1/screens/login_screen.dart';
// import 'package:rtmapp1/screens/profile_screen.dart';
// import 'package:rtmapp1/screens/update_task_screen.dart';

// import 'add_task_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  User? user;
  DatabaseReference? taskRef;

  @override
  void initState() {
    user = FirebaseAuth.instance.currentUser;
    // if (user == null) {
    taskRef =
        // FirebaseDatabase.instance.reference().child('users').child(user!.uid);
        FirebaseDatabase.instance.reference().child('Intrusions');
    // }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromARGB(235, 250, 250, 250),
      drawer: NavigationDrawer(),
      appBar: AppBar(
        title: Text("Historique"),
        centerTitle: true,
      ),

      body: StreamBuilder(
        stream: taskRef != null ? taskRef!.onValue : null,
        builder: (context, snapshot) {
          if (snapshot.hasData && !snapshot.hasError) {
            var event = snapshot.data as Event;

            var snapshot2 = event.snapshot.value;
            if (snapshot2 == null) {
              return const Center(
                child: Text('No users Added Yet'),
              );
            }

            Map<String, dynamic> map = Map<String, dynamic>.from(snapshot2);

            var tasks = <IntrusionModel>[];

            for (var taskMap in map.values) {
              IntrusionModel intrusionModel =
                  IntrusionModel.fromMap(Map<String, dynamic>.from(taskMap));

              tasks.add(intrusionModel);
            }

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                    IntrusionModel task = tasks[index];

                    return Card(
                      // padding: EdgeInsets.all(10),
                      margin: EdgeInsets.only(bottom: 10),
                      // decoration: BoxDecoration(
                      //   border: Border.all(color: Colors.black, width: 2),
                      // ),

                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage:
                              NetworkImage(task.urlImage.toString()),
                          radius: 30.0,
                        ),
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return UpdateTaskScreen(task: task);
                          }));
                        },
                        onLongPress: () {
                          // _delete(documentSnapshot.id, documentSnapshot);
                        },
                        title: Text(task.nameImage.toString()),
                        subtitle: Text(task.distance.toString()),
                      ),
                      // child: Column(
                      //   children: [
                      //     Text(task.distance.toString()),
                      //     // Text(getHumanReadableDate(task.dt)),
                      //     Row(
                      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //       children: [
                      //         IconButton(
                      //           icon: const Icon(Icons.delete),
                      //           onPressed: () {
                      //             showDialog(
                      //                 context: context,
                      //                 builder: (ctx) {
                      //                   return AlertDialog(
                      //                     title: const Text('Confirmation !!!'),
                      //                     content: const Text(
                      //                         'Are you sure to delete ? '),
                      //                     actions: [
                      //                       TextButton(
                      //                           onPressed: () {
                      //                             Navigator.of(ctx).pop();
                      //                           },
                      //                           child: const Text('No')),
                      //                       TextButton(
                      //                           onPressed: () async {
                      //                             // if (taskRef != null) {
                      //                             //   await taskRef!
                      //                             //       .child(task.taskId)
                      //                             //       .remove();
                      //                             // }

                      //                             Navigator.of(ctx).pop();
                      //                           },
                      //                           child: const Text('Yes')),
                      //                     ],
                      //                   );
                      //                 });
                      //           },
                      //         ),
                      //         IconButton(
                      //           icon: const Icon(Icons.edit),
                      //           onPressed: () {
                      //             // Navigator.of(context).push(
                      //             //     MaterialPageRoute(builder: (context) {
                      //             //   return UpdateTaskScreen(task: task);
                      //             // }));
                      //           },
                      //         )
                      //       ],
                      //     )
                      //   ],
                      // ),
                    );
                  }),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  String getHumanReadableDate(int dt) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(dt);

    return DateFormat('dd MMM yyyy').format(dateTime);
  }

  Future<void> _detailInfo() async {
    await Navigator.of(context)
        .push(MaterialPageRoute<String>(builder: (BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Information Personnel"),
          centerTitle: true,
          // backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () {
                // _update(documentSnapshot);
              },
              icon: const Icon(
                Icons.edit,
                size: 20.0,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
          ],
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              // StackContainer(),
              Container(
                height: 250.0,
                child: Stack(
                  children: <Widget>[
                    Container(),
                    ClipPath(
                      clipper: MyCustomClipper(),
                      child: Container(
                        height: 300.0,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage("https://picsum.photos/200"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0, 1),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const CircleAvatar(
                            backgroundImage:
                                NetworkImage("https://picsum.photos/200"),
                            radius: 60.0,
                          ),
                          const SizedBox(height: 4.0),
                          const Text(
                            ("documentSnapshot!['name']"),
                            style: TextStyle(
                              fontSize: 21.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            ("documentSnapshot['phone']"),
                            style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
                      ),
                    ),
                    // TopBar(),
                  ],
                ),
              ),

              Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30.0,
                    vertical: 21.0,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.email,
                          size: 20.0,
                          color: Colors.green,
                        ),
                      ),
                      SizedBox(width: 24.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: const <Widget>[
                          Text(
                            ("documentSnapshot['email']"),
                            style: TextStyle(
                              fontSize: 18.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 21.0,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.functions,
                          size: 20.0,
                          color: Colors.green,
                        ),
                      ),
                      SizedBox(width: 24.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: const <Widget>[
                          Text(
                            ("documentSnapshot['status']"),
                            style: TextStyle(
                              fontSize: 18.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }));
  }
}
