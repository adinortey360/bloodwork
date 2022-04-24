import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../schedule_appointment/schedule_appointment_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class RequestFormWidget extends StatefulWidget {
  const RequestFormWidget({
    Key key,
    this.procedure,
    this.type,
    this.file,
  }) : super(key: key);

  final String procedure;
  final String type;
  final String file;

  @override
  _RequestFormWidgetState createState() => _RequestFormWidgetState();
}

class _RequestFormWidgetState extends State<RequestFormWidget> {
  CollectionReference labs = FirebaseFirestore.instance.collection('labs');
  String selectTest;
  TextEditingController doctor;
  TextEditingController doctorNumber;
  TextEditingController patientName;
  TextEditingController patientNumber;
  String selectLocation;
  TextEditingController location;
  TextEditingController hseno;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  List<String> tests = [];
  String title = '';

  @override
  void initState() {
    super.initState();
    appendTests();
    doctor = TextEditingController();
    doctorNumber = TextEditingController();
    patientName = TextEditingController();
    patientNumber = TextEditingController();
    location = TextEditingController();
    hseno = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () async {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.chevron_left_rounded,
            color: FlutterFlowTheme.grayLight,
            size: 32,
          ),
        ),
        title: Text(
          title,
          style: FlutterFlowTheme.title3.override(
            fontFamily: 'Lexend Deca',
            color: Color(0xFF4E4E4E),
          ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 1,
        decoration: BoxDecoration(),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
                  child: Text(
                    'Please fill the form to complete patient’s test request',
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Lexend Deca',
                      fontSize: 18,
                    ),
                  ),
                ),
                widget.type == 'doctor'
                    ? Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                        child: TextFormField(
                          controller: doctor,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Requesting doctor’s name',
                            labelStyle: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Lexend Deca',
                              color: FlutterFlowTheme.grayLight,
                            ),
                            hintText: 'Doctor\'s name',
                            hintStyle: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Lexend Deca',
                              color: Color(0x98FFFFFF),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFC62828),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFC62828),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding:
                                EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
                          ),
                          style: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Lexend Deca',
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                          keyboardType: TextInputType.phone,
                        ),
                      )
                    : SizedBox(),
                widget.type == 'doctor'
                    ? Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                        child: TextFormField(
                          controller: doctorNumber,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Requesting doctor’s number',
                            labelStyle: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Lexend Deca',
                              color: FlutterFlowTheme.grayLight,
                            ),
                            hintText: 'Phone number',
                            hintStyle: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Lexend Deca',
                              color: Color(0x98FFFFFF),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFC62828),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFC62828),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding:
                                EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
                          ),
                          style: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Lexend Deca',
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                          keyboardType: TextInputType.phone,
                        ),
                      )
                    : SizedBox(),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                  child: TextFormField(
                    controller: patientName,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Patient’s name',
                      labelStyle: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Lexend Deca',
                        color: FlutterFlowTheme.grayLight,
                      ),
                      hintText: 'Patient’s name',
                      hintStyle: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Lexend Deca',
                        color: Color(0x98FFFFFF),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFC62828),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFC62828),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding:
                          EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
                    ),
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Lexend Deca',
                      color: Colors.black,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                  child: TextFormField(
                    controller: patientNumber,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Patient’s number',
                      labelStyle: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Lexend Deca',
                        color: FlutterFlowTheme.grayLight,
                      ),
                      hintText: 'Patient’s number',
                      hintStyle: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Lexend Deca',
                        color: Color(0x98FFFFFF),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFC62828),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFC62828),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding:
                          EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
                    ),
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Lexend Deca',
                      color: Colors.black,
                    ),
                  ),
                ),
                widget.procedure != 'snap'
                    ? Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                        child: StreamBuilder<List<ProcedureRecord>>(
                          stream: queryProcedureRecord(
                            queryBuilder: (procedureRecord) => procedureRecord
                                .where('parent', isEqualTo: widget.procedure),
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 40,
                                  height: 40,
                                  child: SpinKitFadingFour(
                                    color: FlutterFlowTheme.primaryColor,
                                    size: 40,
                                  ),
                                ),
                              );
                            }
                            List<ProcedureRecord> dropDownProcedureRecordList =
                                snapshot.data;
                            return FlutterFlowDropDown(
                              options: tests,
                              onChanged: (val) =>
                                  setState(() => selectTest = val),
                              width: double.infinity,
                              height: 55,
                              textStyle: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Lexend Deca',
                                color: Colors.black,
                              ),
                              fillColor: Colors.white,
                              elevation: 0,
                              borderColor: Color(0xFFC62828),
                              borderWidth: 0,
                              borderRadius: 10,
                              margin:
                                  EdgeInsetsDirectional.fromSTEB(20, 4, 10, 4),
                              hidesUnderline: true,
                            );
                          },
                        ),
                      )
                    : Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(15, 10, 15, 0),
                        child: Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color: Color(0xFFE4FFEE),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Request Attached",
                                  style: FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Lexend Deca',
                                    color: Color(0xFF011509),
                                    fontSize: 17,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 10, 0, 0),
                                  child: Text(
                                    'You have attached a request from camera snap to this request.',
                                    style: FlutterFlowTheme.bodyText1.override(
                                      fontFamily: 'Lexend Deca',
                                      color: Color(0xFF011509),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                  child: FlutterFlowDropDown(
                    initialOption: selectLocation ??= 'Select test location',
                    options: [
                      'Select test location',
                      'Home',
                      'Office',
                      'Walk-In'
                    ].toList(),
                    onChanged: (val) => setState(() => selectLocation = val),
                    width: double.infinity,
                    height: 55,
                    textStyle: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Lexend Deca',
                      color: Colors.black,
                    ),
                    fillColor: Colors.white,
                    elevation: 0,
                    borderColor: Color(0xFFC62828),
                    borderWidth: 0,
                    borderRadius: 10,
                    margin: EdgeInsetsDirectional.fromSTEB(20, 4, 10, 4),
                    hidesUnderline: true,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                  child: TextFormField(
                    controller: location,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Location',
                      labelStyle: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Lexend Deca',
                        color: FlutterFlowTheme.grayLight,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFC62828),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFC62828),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding:
                          EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
                    ),
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Lexend Deca',
                      color: Colors.black,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                  child: TextFormField(
                    controller: hseno,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Building/House name',
                      labelStyle: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Lexend Deca',
                        color: FlutterFlowTheme.grayLight,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFC62828),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFC62828),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding:
                          EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
                    ),
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Lexend Deca',
                      color: Colors.black,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 24, 20, 0),
                  child: FFButtonWidget(
                    onPressed: () {
                      handleLab();
                    },
                    text: 'Continue',
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                    ),
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 50,
                      color: Color(0xFFC62828),
                      textStyle: FlutterFlowTheme.subtitle2.override(
                        fontFamily: 'Lexend Deca',
                        color: FlutterFlowTheme.textColor,
                      ),
                      elevation: 3,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: 30,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  handleLab() {
    if (widget.type == 'doctor' && doctor.text == "") {
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Oops!'),
          content: const Text('Please enter doctor\'s name'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
      );
      return false;
    }

    if (widget.type == 'doctor' && doctorNumber.text == "") {
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Oops!'),
          content: const Text('Please enter doctor\'s contact number'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
      );
      return false;
    }

    if (patientName.text == "" || patientNumber.text == "") {
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Oops!'),
          content: const Text('Please enter patient\'s number'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
      );
      return false;
    }

    if (widget.procedure != 'snap') {
      if (selectTest == "" ||
          selectTest == null ||
          selectTest == "Select requested test") {
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('Oops!'),
            content: const Text('Please select a test'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          ),
        );
        return false;
      }
    }

    if (selectLocation == "" ||
        selectLocation == "Select test location" ||
        selectLocation == null) {
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Oops!'),
          content: const Text('Please select the location'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
      );
      return false;
    }

    if (selectLocation != "Walk-In" && location.text == "") {
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Oops!'),
          content: const Text('Please enter the address'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
      );
      return false;
    }

    return labs
        .add({
          'doctor': doctor.text,
          'doctor_number': doctorNumber.text,
          'patient_name': patientName.text,
          'patient_number': patientNumber.text,
          'location': location.text,
          'hseno': hseno.text,
          'file': widget.file,
          'requested_test': selectTest,
          'select_location': selectLocation
        })
        .then((value) async => {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ScheduleAppointmentWidget(
                      documentid: value.id,
                      location: selectLocation,
                      test: selectTest),
                ),
              )
            })
        .catchError((error) => print("Failed to add user: $error"));
  }

  appendTests() {
    print("IN IT");
    var parent = widget.procedure;
    print(parent);
    if (parent == 'us') {
      setState(() => {
            title = 'Ultrasound Scan',
            tests = ['Select requested test', 'Example Test 1']
          });
    }
    if (parent == 'medical') {
      setState(() => {
            title = 'Medical Lab Tests',
            tests = ['Select requested test', 'Example Test 1']
          });
    }
    if (parent == 'ecg') {
      setState(() => {
            title = 'Electrocardiogram',
            tests = ['Select requested test', 'Example Test 1']
          });
    }
    if (parent == 'xray') {
      setState(() => {
            title = 'X-ray Imaging',
            tests = ['Select requested test', 'Example Test 1']
          });
    }
    if (parent == 'snap') {
      setState(() => {
            title = 'Scanned Test',
          });
    }
  }
}
