// // import 'package:firebase_database/firebase_database.dart';
// // import 'package:firebase_database/ui/firebase_animated_list.dart';
// // import 'package:flutter/material.dart';
// // import 'package:rtmapp1/screens/user_list.dart';

// // class ListUserScreen extends StatefulWidget {
// //   const ListUserScreen({Key? key}) : super(key: key);

// //   @override
// //   State<ListUserScreen> createState() => _ListUserScreenState();
// // }

// // class _ListUserScreenState extends State<ListUserScreen> {
// //   Query dbRef = FirebaseDatabase.instance.ref().child('Users');
// //   DatabaseReference reference = FirebaseDatabase.instance.ref().child('Users');
// //   static FirebaseDatabase database = FirebaseDatabase.instance;
// //   Future<Object?> getBookables() async {
// //     DatabaseReference ref = database.reference().child('/');
// //     DatabaseEvent event = await ref.once();
// //     print("sdfghjk");
// //     print(event.snapshot.value);
// //     var list = event.snapshot.value;
// //     return list;
// //   }

// //   Widget listItem({required Map student}) {
// //     return Container(
// //       margin: const EdgeInsets.all(10),
// //       padding: const EdgeInsets.all(10),
// //       height: 110,
// //       color: Colors.amberAccent,
// //       child: Column(
// //         mainAxisAlignment: MainAxisAlignment.center,
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           Text(
// //             student['name'],
// //             style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
// //           ),
// //           const SizedBox(
// //             height: 5,
// //           ),
// //           Text(
// //             student['email'],
// //             style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
// //           ),
// //           const SizedBox(
// //             height: 5,
// //           ),
// //           Text(
// //             student['phone'],
// //             style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
// //           ),
// //           Row(
// //             mainAxisAlignment: MainAxisAlignment.end,
// //             crossAxisAlignment: CrossAxisAlignment.center,
// //             children: [
// //               GestureDetector(
// //                 onTap: () {
// //                   Navigator.push(
// //                       context,
// //                       MaterialPageRoute(
// //                           builder: (_) =>
// //                               UpdateRecord(studentKey: student['key'])));
// //                 },
// //                 child: Row(
// //                   children: [
// //                     Icon(
// //                       Icons.edit,
// //                       color: Theme.of(context).primaryColor,
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //               const SizedBox(
// //                 width: 6,
// //               ),
// //               GestureDetector(
// //                 onTap: () {
// //                   reference.child(student['key']).remove();
// //                 },
// //                 child: Row(
// //                   children: [
// //                     Icon(
// //                       Icons.delete,
// //                       color: Colors.red[700],
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //             ],
// //           )
// //         ],
// //       ),
// //     );
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //         appBar: AppBar(
// //           title: const Text('Fetching data'),
// //         ),
// //         body: Container(
// //           height: double.infinity,
// //           child: FirebaseAnimatedList(
// //             query: dbRef,
// //             itemBuilder: (BuildContext context, DataSnapshot snapshot,
// //                 Animation<double> animation, int index) {
// //               Map list = snapshot.value as Map;
// //               list['key'] = snapshot.key;

// //               return listItem(student: list);
// //             },
// //           ),
// //         ));
// //   }
// // }

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_database/firebase_database.dart';

// class ListUserScreen extends StatelessWidget {
//   final databaseReference = FirebaseDatabase.instance.reference();

//   @override
//   Widget build(BuildContext context) {
//     readData();
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Flutter Realtime Database Demo'),
//       ),
//       body: Center(
//           child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: <Widget>[
//             RaisedButton(
//               child: Text('Create Data'),
//               color: Colors.redAccent,
//               onPressed: () {
//                 createData();
//               },
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(20))),
//             ),
//             SizedBox(
//               height: 8,
//             ),
//             RaisedButton(
//               child: Text('Read/View Data'),
//               color: Colors.redAccent,
//               onPressed: () {
//                 getBookables();
//               },
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(20))),
//             ),
//             SizedBox(
//               height: 8,
//             ),
//             RaisedButton(
//               child: Text('Update Data'),
//               color: Colors.redAccent,
//               onPressed: () {
//                 updateData();
//               },
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(20))),
//             ),
//             SizedBox(
//               height: 8,
//             ),
//             RaisedButton(
//               child: Text('Delete Data'),
//               color: Colors.redAccent,
//               onPressed: () {
//                 deleteData();
//               },
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(20))),
//             ),
//           ],
//         ),
//       )), //center
//     );
//   }

//   void createData() {
//     databaseReference
//         .child("flutterDevsTeam1")
//         .set({'name': 'Deepak Nishad', 'description': 'Team Lead'});
//     databaseReference.child("flutterDevsTeam2").set(
//         {'name': 'Yashwant Kumar', 'description': 'Senior Software Engineer'});
//     databaseReference
//         .child("flutterDevsTeam3")
//         .set({'name': 'Akshay', 'description': 'Software Engineer'});
//     databaseReference
//         .child("flutterDevsTeam4")
//         .set({'name': 'Aditya', 'description': 'Software Engineer'});
//     databaseReference
//         .child("flutterDevsTeam5")
//         .set({'name': 'Shaiq', 'description': 'Associate Software Engineer'});
//     databaseReference
//         .child("flutterDevsTeam6")
//         .set({'name': 'Mohit', 'description': 'Associate Software Engineer'});
//     databaseReference
//         .child("flutterDevsTeam7")
//         .set({'name': 'Naveen', 'description': 'Associate Software Engineer'});
//   }

//   void readData() {
//     final DatabaseReference db = FirebaseDatabase.instance.reference();
//     db
//         .child('flutterDevsTeam7')
//         .once()
//         .then((result) => print('result = $result'));
//   }

//   void updateData() {
//     databaseReference.child('flutterDevsTeam1').update({'description': 'CEO'});
//     databaseReference
//         .child('flutterDevsTeam2')
//         .update({'description': 'Team Lead'});
//     databaseReference
//         .child('flutterDevsTeam3')
//         .update({'description': 'Senior Software Engineer'});
//   }

//   void deleteData() {
//     databaseReference.child('flutterDevsTeam1').remove();
//     databaseReference.child('flutterDevsTeam2').remove();
//     databaseReference.child('flutterDevsTeam3').remove();
//   }

//   static FirebaseDatabase database = FirebaseDatabase.instance;
//   Future<Object?> getBookables() async {
//     DatabaseReference ref = database.reference().child('Intrusions');
//     DataSnapshot event = await ref.once();
//     print("sdfghjk");
//     print(event.value);
//     var list = event.value;
//     return list;
//   }
// }

// class Bookable {
//   Bookable(String s, int i);
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:rtmapp1/common/customclipper.dart';
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

class ListUserScreen extends StatefulWidget {
  const ListUserScreen({Key? key}) : super(key: key);

  @override
  _ListUserScreenState createState() => _ListUserScreenState();
}

class _ListUserScreenState extends State<ListUserScreen> {
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
      appBar: AppBar(
        title: const Text('Historiques'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return ProfilScreen();
                }));
              },
              icon: const Icon(Icons.person)),
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (ctx) {
                      return AlertDialog(
                        title: Text('Confirmation !!!'),
                        content: Text('Are you sure to Log Out ? '),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(ctx).pop();
                            },
                            child: Text('No'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(ctx).pop();

                              FirebaseAuth.instance.signOut();

                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(builder: (context) {
                                return LoginScreen();
                              }));
                            },
                            child: Text('Yes'),
                          ),
                        ],
                      );
                    });
              },
              icon: const Icon(Icons.logout)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          //   return AddTaskScreen();
          // }));
        },
        child: const Icon(Icons.add),
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



// {"heure": "050720GTT220:01:QQHZYYRRHHG", "nameImage": "0507202210:01:23.jpgQ", "distance": "74.42", "urlImage": "https://firebasestorage"}