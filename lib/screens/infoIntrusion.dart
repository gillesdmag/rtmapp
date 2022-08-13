import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rtmapp1/common/customclipper.dart';
import 'package:rtmapp1/models/intrusion_model.dart';

class UpdateTaskScreen extends StatefulWidget {
  final IntrusionModel task;

  const UpdateTaskScreen({Key? key, required this.task}) : super(key: key);

  @override
  _UpdateTaskScreenState createState() => _UpdateTaskScreenState();
}

class _UpdateTaskScreenState extends State<UpdateTaskScreen> {
  var nameController = TextEditingController();
  var tasks = <IntrusionModel>[];

  @override
  void initState() {
    super.initState();
    // nameController.text = widget.task.urlImage!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Task'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 10.0,
        ),
        child: Column(
          children: <Widget>[
            // StackContainer(),

            Container(
              height: 250.0,
              child: Stack(
                children: <Widget>[
                  Container(),

                  ClipPath(
                    clipper: MyCustomClipper2(),
                    child: Container(
                      height: 300.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        image: DecorationImage(
                          image: NetworkImage(widget.task.urlImage.toString()),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment(0.96, 0.96),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.location_on_outlined,
                            color: Colors.red,
                            size: 35,
                          ),
                        ),
                        const Text(
                          'Position',
                          style: TextStyle(
                            fontSize: 12.0,
                          ),
                        )
                      ],
                    ),
                  ),
                  // TopBar(),
                ],
              ),
            ),

            TextField(
              controller: nameController,
              decoration:
                  const InputDecoration(hintText: 'Ajouter un Commentaire'),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () async {
                  var taskName = nameController.text.trim();
                  if (taskName.isEmpty) {
                    Fluttertoast.showToast(msg: 'Please provide task name');
                    return;
                  }

                  User? user = FirebaseAuth.instance.currentUser;

                  if (user != null) {
                    DatabaseReference taskRef = FirebaseDatabase.instance
                        .reference()
                        .child('tasks')
                        .child(user.uid)
                        .child(widget.task.distance.toString());

                    await taskRef.update({
                      'taskName': taskName,
                    });
                  }
                },
                child: const Text('Update')),
            // ListView.builder(
            //     itemCount: widget.task.toString().length,
            //     itemBuilder: (context, index) {
            //       IntrusionModel task = tasks[index];

            //       return Card(
            //         // padding: EdgeInsets.all(10),
            //         margin: EdgeInsets.only(bottom: 10),
            //         // decoration: BoxDecoration(
            //         //   border: Border.all(color: Colors.black, width: 2),
            //         // ),

            //         child: ListTile(
            //           leading: CircleAvatar(
            //             backgroundImage: NetworkImage(task.urlImage.toString()),
            //             radius: 30.0,
            //           ),
            //           onTap: () {
            //             Navigator.of(context)
            //                 .push(MaterialPageRoute(builder: (context) {
            //               return UpdateTaskScreen(task: task);
            //             }));
            //           },
            //           onLongPress: () {
            //             // _delete(documentSnapshot.id, documentSnapshot);
            //           },
            //           title: Text(task.nameImage.toString()),
            //           subtitle: Text(task.distance.toString()),
            //         ),

            //       );
            //     }),

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
                      children: <Widget>[
                        Text(
                          "loggedInUser.email",
                          style: const TextStyle(
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

      // Padding(
      //   padding: const EdgeInsets.all(8.0),
      //   child: Column(
      //     children: [
      //       TextField(
      //         controller: nameController,
      //         decoration: const InputDecoration(hintText: 'Task Name'),
      //       ),
      //       const SizedBox(
      //         height: 10,
      //       ),
      //       ElevatedButton(
      //           onPressed: () async {
      //             var taskName = nameController.text.trim();
      //             if (taskName.isEmpty) {
      //               Fluttertoast.showToast(msg: 'Please provide task name');
      //               return;
      //             }

      //             User? user = FirebaseAuth.instance.currentUser;

      //             if (user != null) {
      //               DatabaseReference taskRef = FirebaseDatabase.instance
      //                   .reference()
      //                   .child('tasks')
      //                   .child(user.uid)
      //                   .child(widget.task.urlImage.toString());

      //               await taskRef.update({
      //                 'taskName': taskName,
      //               });
      //             }
      //           },
      //           child: const Text('Update')),
      //     ],
      //   ),
      // ),
    );
  }
}
