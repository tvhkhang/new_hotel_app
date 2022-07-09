import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:new_hotel_app/services/storage_services.dart';
import 'package:new_hotel_app/ui/constants/colors.dart';
import 'package:new_hotel_app/ui/constants/styles.dart';
import 'package:new_hotel_app/ui/widgets/buttons.dart';
import 'package:new_hotel_app/ui/widgets/textformfield.dart';

class AddHotelPage extends StatefulWidget {
  const AddHotelPage({Key? key}) : super(key: key);

  @override
  State<AddHotelPage> createState() => _AddHotelPage();
}

class _AddHotelPage extends State<AddHotelPage> {
  File? image;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  final _hotelNameController = TextEditingController();

  final _addressController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final users = FirebaseFirestore.instance.collection('hotels');
    final firebaseStorage = FirebaseStorage.instanceFor(
        app: FirebaseFirestore.instance.app,
        bucket: 'gs://flutter-project-56d54.appspot.com/');
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            icon: Image.asset(
              'assets/images/1x/arrow-left.png',
              color: ColorApp.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: ColorApp.backgroundApp,
          title: Text(
            'Add Hotel',
            style: StyleApp.welcome,
          ),
          centerTitle: true,
        ),
        body: Container(
            padding: EdgeInsets.only(
                right: size.width * 0.07, left: size.width * 0.07),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Text(
                    'Hotel Name',
                    style: StyleApp.namehotel,
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  TextForm(
                      controller: _hotelNameController,
                      text: 'Input for hotel name'),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Text(
                    'Do not exceed 40 characters when entering.',
                    style: StyleApp.alive,
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Text(
                    'Address',
                    style: StyleApp.namehotel,
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  TextForm(
                      controller: _addressController,
                      text: 'Input for address'),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Text(
                    'Description',
                    style: StyleApp.namehotel,
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  TextForm(
                      controller: _descriptionController,
                      text: 'Input for description'),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Text(
                    'Hotel Image',
                    style: StyleApp.namehotel,
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  DottedBorder(
                    color: ColorApp.black,
                    strokeWidth: 1,
                    child: GestureDetector(
                      child: image != null
                          ? Image.file(image!, fit: BoxFit.fill)
                          : Image.asset('assets/images/1x/add_image.png'),
                      onTap: () {
                        pickImage();
                      },
                    ),
                  )
                ],
              ),
            )),
        bottomNavigationBar: Container(
          padding: EdgeInsets.only(
              left: size.width * 0.07,
              right: size.width * 0.07,
              bottom: size.height * 0.02,
              top: size.height * 0.02),
          child: Row(
            children: [
              ButtonFlexible(
                onPressed: () {},
                text: "Cancel",
                color: ColorApp.backgroundApp,
                flex: 1,
                style: StyleApp.buttonCancel,
              ),
              SizedBox(
                width: size.width * 0.035,
              ),
              ButtonFlexible(
                onPressed: () async {
                  Storage()
                      .uploadFile(image!.path, _hotelNameController.text)
                      .then((value) {
                    print('done');
                    final json = {
                      'star': 0.0,
                      'name': _hotelNameController.text,
                      'address': _addressController.text,
                      'description': _descriptionController.text,
                    };
                    users.doc(_hotelNameController.text).set(json);
                    Navigator.pop(context);
                  });
                },
                text: "Done",
                color: ColorApp.blue,
                flex: 2,
                style: StyleApp.buttonSignIn,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() {
        this.image = imageTemporary;
      });
    } on PlatformException catch (e) {
      print("Failed catch $e");
    }
  }
}
