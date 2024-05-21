import 'dart:io';

import 'package:flutter/material.dart';
import 'package:investify/constants.dart';
import 'package:investify/features/add_project/data/services/project_services.dart';
import 'package:investify/features/add_project/presentatin/customized_text_form_fiels2.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class AddProgectView extends StatefulWidget {
  const AddProgectView({Key? key}) : super(key: key);

  @override
  State<AddProgectView> createState() => _AddProgectViewState();
}

class _AddProgectViewState extends State<AddProgectView> {
  File? image;
  File? video;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  bool _isLoading = false;

  Future PicImageFromGallery() async {
    final returnedMedia = await ImagePicker().pickMedia();
    if (returnedMedia == null) return;
    setState(() {
      image = File(returnedMedia.path);
    });
  }

  Future pickVideoFromGallery() async {
    final pickedVideo =
        await ImagePicker().pickVideo(source: ImageSource.gallery);
    if (pickedVideo == null) return;

    setState(() {
      video = File(pickedVideo.path);
    });
  }

  void showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Color(0XFFF6F6F9),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: gradientColor,
          ),
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 80,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 8),
                child: Text(
                  'Add Your Progect',
                  style: TextStyle(
                      color: Colors.white, fontSize: 28, fontFamily: 'dongel'),
                ),
              ),
              Container(
                height: 160,
                width: 80,
                child: Image.asset('lib/assets/images/logo2.png'),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  children: [
                    CustomizedTextFormField2(
                      hint: 'Title',
                      color: Colors.white,
                      controller: titleController,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomizedTextFormField2(
                      hint: 'Description',
                      color: Colors.white,
                      controller: descriptionController,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomizedTextFormField2(
                      hint: 'Enter The Price',
                      color: Colors.white,
                      controller: priceController,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        const Text(
                          'Add Image',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontFamily: 'dongel'),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                          ),
                          child: Center(
                            child: InkWell(
                              onTap: () {
                                PicImageFromGallery();
                              },
                              child: const Icon(
                                Icons.add,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        image != null
                            ? Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: SizedBox(
                                  height: 40,
                                  width: 45,
                                  child: Image.file(image!),
                                ),
                              )
                            : const Text('')
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        const Text(
                          'Add Video ',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontFamily: 'dongel'),
                        ),
                        const SizedBox(
                          width: 7.5,
                        ),
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                          ),
                          child: Center(
                            child: InkWell(
                              onTap: () {
                                pickVideoFromGallery();
                              },
                              child: const Icon(
                                Icons.add,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        video != null
                            ? const Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: SizedBox(
                                  height: 40,
                                  width: 72,
                                  child: Text('succeeded'),
                                ),
                              )
                            : const Text('')
                      ],
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                    Container(
                      height: 60,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color(0xFF17B861),
                      ),
                      child: Center(
                        child: InkWell(
                          onTap: () async {
                            setState(() {
                              _isLoading = true;
                            });

                            int? price = int.tryParse(priceController.text);

                            if (price == null) {
                              // Handle the case when price is not a valid integer
                              showSnackbar('Please enter a valid price');
                              setState(() {
                                _isLoading = false;
                              });
                              return;
                            }

                            if (image == null || video == null) {
                              // Handle the case when either image or video is not selected
                              showSnackbar(
                                  'Please select both image and video');
                              setState(() {
                                _isLoading = false;
                              });
                              return;
                            }

                            try {
                              await ProjectServices()
                                  .addProject(
                                title: titleController.text,
                                description: descriptionController.text,
                                price: price,
                                image: File(image!.path),
                                video: File(video!.path),
                              )
                                  .then((success) {
                                if (success) {
                                  const snackBar = SnackBar(
                                    content: Text('Project added successfully'),
                                    behavior: SnackBarBehavior.floating,
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                } else {
                                  const snackBar = SnackBar(
                                    content: Text('Failed to add project'),
                                    behavior: SnackBarBehavior.floating,
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                }
                              });

                              // showSnackbar('Project added successfully');
                            } catch (e) {
                              showSnackbar('');
                            }

                            setState(() {
                              _isLoading = false;
                            });
                          },
                          child: _isLoading
                              ? SpinKitThreeBounce(
                                  color: Colors.white,
                                  size: 26,
                                )
                              : const Text(
                                  'Add',
                                  style: TextStyle(
                                    fontSize: 26,
                                    color: Color(0XFFE6FDF0),
                                  ),
                                ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
