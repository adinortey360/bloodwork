import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:bloodwork/select_type/select_type_widget.dart';
import 'package:image_picker/image_picker.dart';

import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:camera_camera/camera_camera.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:path/path.dart' as path;

class SnapLabWidget extends StatefulWidget {
  const SnapLabWidget({Key key}) : super(key: key);

  @override
  _SnapLabWidgetState createState() => _SnapLabWidgetState();
}

class _SnapLabWidgetState extends State<SnapLabWidget> {
  FirebaseStorage storage = FirebaseStorage.instance;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final photos = <File>[];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFC62828),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Material(
                color: Colors.transparent,
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                    topLeft: Radius.circular(0),
                    topRight: Radius.circular(0),
                  ),
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.76,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: photos.isEmpty
                          ? MemoryImage(kTransparentImage)
                          : FileImage(photos[0]),
                    ),
                    color: FlutterFlowTheme.darkBackground,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(0),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 44, 20, 20),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Card(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              color: FlutterFlowTheme.background,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 30,
                                buttonSize: 48,
                                icon: Icon(
                                  Icons.close_rounded,
                                  color: FlutterFlowTheme.textColor,
                                  size: 30,
                                ),
                                onPressed: () async {
                                  if (photos.isNotEmpty) {
                                    setState(() {
                                      isLoading = false;
                                      photos.clear();
                                    });
                                  } else {
                                    Navigator.pop(context);
                                  }
                                },
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        photos.isNotEmpty
                            ? isLoading == false
                                ? FFButtonWidget(
                                    showLoadingIndicator: true,
                                    onPressed: () {
                                      _upload();
                                    },
                                    text: 'Send Request',
                                    icon: Icon(
                                      Icons.send,
                                      size: 15,
                                    ),
                                    options: FFButtonOptions(
                                      width: 300,
                                      height: 70,
                                      color: Color(0xFFC62828),
                                      textStyle: FlutterFlowTheme.title1,
                                      elevation: 0,
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1,
                                      ),
                                      borderRadius: 12,
                                    ),
                                  )
                                : Center(
                                    child: SizedBox(
                                      width: 40,
                                      height: 40,
                                      child: SpinKitFadingFour(
                                        color: Colors.white,
                                        size: 40,
                                      ),
                                    ),
                                  )
                            : FFButtonWidget(
                                onPressed: () {
                                  openCamera();
                                },
                                text: 'Scan Now',
                                icon: Icon(
                                  Icons.camera_sharp,
                                  size: 15,
                                ),
                                options: FFButtonOptions(
                                  width: 300,
                                  height: 70,
                                  color: Color(0xFFC62828),
                                  textStyle: FlutterFlowTheme.title1,
                                  elevation: 0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                  borderRadius: 12,
                                ),
                              )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }

  void openCamera() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => CameraCamera(
                  onFile: (file) {
                    photos.add(file);
                    Navigator.pop(context);
                    setState(() {});
                  },
                )));
  }

// Select and image from the gallery or take a picture with the camera
  // Then upload to Firebase Storage
  Future<void> _upload() async {
    setState(() {
      isLoading = true;
    });
    try {
      final String fileName = path.basename(photos[0].toString());
      File imageFile = photos[0];

      try {
        // Uploading the selected image with some custom meta data
        var uploadTask = await storage.ref(fileName).putFile(imageFile);
        print(uploadTask.ref.fullPath);

        setState(() {
          isLoading = false;
          photos.clear();
        });

        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SelectTypeWidget(
                procedure: 'snap', file: uploadTask.ref.fullPath),
          ),
        );

        // Refresh the UI
        setState(() {});
      } on FirebaseException catch (error) {
        print(error);
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('Upload failed'),
            content: const Text(
                'Your upload was unsuccessful due to an internet connection error. Please check your connection and try again.'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          ),
        );
        setState(() {
          isLoading = false;
        });
      }
    } catch (err) {
      print(err);
      setState(() {
        isLoading = false;
      });
    }
  }

  // Retriew the uploaded images
  // This function is called when the app launches for the first time or when an image is uploaded or deleted
  Future<List<Map<String, dynamic>>> _loadImages() async {
    List<Map<String, dynamic>> files = [];

    final ListResult result = await storage.ref().list();
    final List<Reference> allFiles = result.items;

    await Future.forEach<Reference>(allFiles, (file) async {
      final String fileUrl = await file.getDownloadURL();
      final FullMetadata fileMeta = await file.getMetadata();
      files.add({
        "url": fileUrl,
        "path": file.fullPath,
        "uploaded_by": fileMeta.customMetadata['uploaded_by'] ?? 'Nobody',
        "description":
            fileMeta.customMetadata['description'] ?? 'No description'
      });
    });

    return files;
  }

  // Delete the selected image
  // This function is called when a trash icon is pressed
  Future<void> _delete(String ref) async {
    await storage.ref(ref).delete();
    // Rebuild the UI
    setState(() {});
  }
}
