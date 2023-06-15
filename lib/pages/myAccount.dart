import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drums_pad/services/auth.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:percent_indicator/percent_indicator.dart';

class MyAccountPage extends StatefulWidget {
  const MyAccountPage({super.key});

  @override
  State<MyAccountPage> createState() => _MyAccountPageState();
}

class _MyAccountPageState extends State<MyAccountPage> {
  User? user;
  Map<String, dynamic>? userData;
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  String _errorMessage = '';
  double imageuploadProgress = 0.0;
  String ImageUrl = '';
  PlatformFile? pickedImage;

  @override
  void initState() {
    super.initState();
    user = Auth().currentUser;
    getUserData();
  }

  getUserData() async {
    var data = await FirebaseFirestore.instance
        .collection('users')
        .doc(user?.uid)
        .get();
    userData = data.data();

    setState(() async {
      nameController.text = userData?['name'];
      phoneController.text = userData?['phone'];
      ImageUrl = userData?['photo'];
    });
  }

  Future selectImage() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg'],
    );
    if (result == null) return;

    setState(() {
      pickedImage = result.files.first;
    });

    final path = 'UserImage/${user?.uid}';
    final file = File(pickedImage!.path!);

    final ref = FirebaseStorage.instance.ref().child(path);
    var uploadTask = ref.putFile(file);
    uploadTask.snapshotEvents.listen((snapshot) {
      double progress =
          snapshot.bytesTransferred / snapshot.totalBytes.toDouble();
      setState(() {
        imageuploadProgress = progress;
      });
    });
    await uploadTask;
    String downloadUrl = await ref.getDownloadURL();
    Fluttertoast.showToast(
      msg: 'Image Uploaded Successfully',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2,
      backgroundColor: Colors.greenAccent,
      textColor: Colors.black,
      fontSize: 16.0,
    );
    setState(() {
      ImageUrl = downloadUrl;
      imageuploadProgress = 0.0;
    });
  }

  updateData() async {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return Dialog(
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  CircularProgressIndicator(),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Loading...',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });

    await FirebaseFirestore.instance.collection('users').doc(user?.uid).update({
      'name': nameController.text,
      'phone': phoneController.text,
      'photo': ImageUrl,
    });

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('users')
              .doc(user?.uid)
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              // getUserData(snapshot);
              userData = snapshot.data!.data();
              return Scaffold(
                backgroundColor: Colors.black,
                body: SafeArea(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 12),
                            child: InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: const SizedBox(
                                height: 23,
                                width: 23,
                                child: Image(
                                    image:
                                        AssetImage('Assets/icons/close.png')),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Row(
                              children: const [
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'My Account',
                                    style: TextStyle(
                                      color: Color.fromARGB(182, 221, 219, 219),
                                      fontSize: 21,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        color: Colors.black,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                child: Stack(
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(
                                        top: 100,
                                        right: 50,
                                        left: 50,
                                      ),
                                      child: SizedBox(
                                        height: 90,
                                        width: 200,
                                        child: Image(
                                          image: AssetImage(
                                            'Assets/imageShadow.png',
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 15,
                                        left: 80,
                                        right: 80,
                                      ),
                                      child: SizedBox(
                                        height: 130,
                                        width: 130,
                                        child: userData?['photo'] != null
                                            ? ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                                child: FadeInImage(
                                                  placeholder: const AssetImage(
                                                    'Assets/DefaultProfile.png',
                                                  ),
                                                  image: NetworkImage(ImageUrl),
                                                  fit: BoxFit.fill,
                                                  fadeInDuration:
                                                      const Duration(
                                                          milliseconds: 300),
                                                  fadeOutDuration:
                                                      const Duration(
                                                          milliseconds: 300),
                                                ),
                                              )
                                            : const Image(
                                                image: AssetImage(
                                                  'Assets/DefaultProfile.png',
                                                ),
                                              ),
                                      ),
                                    ),
                                    imageuploadProgress != 0.0
                                        ? Padding(
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 15,
                                              horizontal: 80,
                                            ),
                                            child: Container(
                                              height: 140,
                                              width: 130,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                                color: Colors.black,
                                              ),
                                              child: Center(
                                                child: CircularPercentIndicator(
                                                  radius: 70,
                                                  lineWidth: 5.0,
                                                  percent: imageuploadProgress,
                                                  center: Text(
                                                    '${(imageuploadProgress * 100).toString()}%',
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                  progressColor: Colors.cyan,
                                                ),
                                              ),
                                            ),
                                          )
                                        : const SizedBox(),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 110,
                                        left: 175,
                                      ),
                                      child: InkWell(
                                        onTap: selectImage,
                                        child: Container(
                                          height: 35,
                                          width: 35,
                                          decoration: BoxDecoration(
                                            color: Colors.cyan,
                                            borderRadius:
                                                BorderRadius.circular(100),
                                          ),
                                          child: const Icon(
                                            Icons.edit,
                                            color: Colors.black,
                                            size: 20,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width - 60,
                                child: Center(
                                  child: TextFormField(
                                    style: const TextStyle(color: Colors.white),
                                    controller: nameController,
                                    onChanged: (value) {
                                      if (value.isEmpty) {
                                        setState(() {
                                          _errorMessage =
                                              '* Name cannot be empty';
                                        });
                                      } else {
                                        setState(() {
                                          _errorMessage = '';
                                        });
                                      }
                                    },
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor:
                                          const Color.fromARGB(255, 44, 49, 50),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(13),
                                      ),
                                      hintText: 'Name',
                                      hintStyle:
                                          const TextStyle(color: Colors.grey),
                                      labelText: 'Name',
                                      labelStyle: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 25, bottom: 10),
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width - 60,
                                  child: Center(
                                    child: TextFormField(
                                      style:
                                          const TextStyle(color: Colors.white),
                                      controller: phoneController,
                                      onChanged: (value) {
                                        setState(() {
                                          if (value.isEmpty) {
                                            _errorMessage =
                                                '* Phone number cannot be empty';
                                          } else if (value.length != 10) {
                                            _errorMessage =
                                                '* Phone number invalid';
                                          } else {
                                            _errorMessage = '';
                                          }
                                        });
                                      },
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: const Color.fromARGB(
                                            255, 44, 49, 50),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(13),
                                        ),
                                        hintText: 'Phone',
                                        hintStyle:
                                            const TextStyle(color: Colors.grey),
                                        labelText: 'Phone',
                                        labelStyle: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Text(
                                  _errorMessage,
                                  style: const TextStyle(
                                    color: Color.fromARGB(255, 212, 0, 0),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: _errorMessage == '' ? updateData : null,
                                child: Container(
                                  width: 180,
                                  height: 45,
                                  decoration: BoxDecoration(
                                    color:
                                        const Color.fromARGB(255, 7, 116, 130),
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 1,
                                    ),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      'Update',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
