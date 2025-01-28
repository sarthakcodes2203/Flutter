import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:todo_app/controllers/profileController.dart';
import 'package:todo_app/models/userModel.dart';
import 'package:todo_app/routes/routes.dart';
import 'package:todo_app/views/screenS/profile.dart';

class Profileusermanagement extends StatelessWidget {
  Profileusermanagement({Key? key}) : super(key: key);
  String routeName = "/profileUserManagement";

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Profilecontroller());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                // Routes().ciHome,
                Routes().profile,
                (route) => false,
              );
            },
            icon: const Icon(Icons.arrow_back_ios)),
        title: Text(
          "User Details",
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: FutureBuilder(
            future: controller.getUserData(),
            // future: controller.getAllUser(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  Usermodel userData = snapshot.data as Usermodel;
                  return Column(
                    children: [
                      // -- IMAGE with ICON
                      Stack(
                        children: [
                          SizedBox(
                            width: 120,
                            height: 120,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: const Image(
                                    image: AssetImage('assets/dp.jpg'))),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: Colors.grey),
                              child: const Icon(LineAwesomeIcons.camera,
                                  color: Colors.black, size: 20),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 50),

                      // -- Form Fields
                      Form(
                        child: Column(
                          children: [
                            TextFormField(
                              initialValue: userData.fullName,
                              decoration: const InputDecoration(
                                  label: Text('Sarthak Chakraborty'),
                                  prefixIcon: Icon(LineAwesomeIcons.user)),
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              initialValue: userData.email,
                              decoration: const InputDecoration(
                                  label: Text('Sarthak@gmail.com'),
                                  prefixIcon:
                                      Icon(LineAwesomeIcons.envelope_1)),
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              initialValue: userData.phoneNo,
                              decoration: const InputDecoration(
                                  label: Text('0123456789'),
                                  prefixIcon: Icon(LineAwesomeIcons.phone)),
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              initialValue: userData.password,
                              obscureText: true,
                              decoration: InputDecoration(
                                label: const Text('abcde'),
                                prefixIcon: const Icon(Icons.fingerprint),
                                suffixIcon: IconButton(
                                    icon:
                                        const Icon(LineAwesomeIcons.eye_slash),
                                    onPressed: () {}),
                              ),
                            ),
                            const SizedBox(height: 32),

                            // -- Form Submit Button
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pushNamedAndRemoveUntil(
                                    context,
                                    // Routes().ciHome,
                                    Routes().profileUpdate,
                                    (route) => false,
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.grey,
                                    side: BorderSide.none,
                                    shape: const StadiumBorder()),
                                child: const Text('Save',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 16)),
                              ),
                            ),
                            const SizedBox(height: 12),

                            // -- Created Date and Delete Button
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text.rich(
                                  TextSpan(
                                    text: "Joined ",
                                    style: TextStyle(fontSize: 12),
                                    children: [
                                      TextSpan(
                                          text: "25 October 2024",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12))
                                    ],
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          Colors.redAccent.withOpacity(0.1),
                                      elevation: 0,
                                      foregroundColor: Colors.red,
                                      shape: const StadiumBorder(),
                                      side: BorderSide.none),
                                  child: const Text("Delete"),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Center(child: Text(snapshot.error.toString()));
                } else {
                  return Center(
                    child: Text('Something went wrong'),
                  );
                }
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }
}
