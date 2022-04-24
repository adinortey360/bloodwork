import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';
import 'package:bloodwork/cash_payment/cash_payment_widget.dart';
import 'package:intl/intl.dart';

import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentMethodWidget extends StatefulWidget {
  const PaymentMethodWidget({Key key, this.documentid, this.test})
      : super(key: key);

  final String documentid;
  final String test;

  @override
  _PaymentMethodWidgetState createState() => _PaymentMethodWidgetState();
}

class _PaymentMethodWidgetState extends State<PaymentMethodWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  int amount = 0;

  @override
  void initState() {
    super.initState();
    updatePrice();
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
          'Order Test',
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
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              amount > 0
                  ? Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 24, 20, 0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          _launchURL(
                              context,
                              'https://bloodwork.web.app?id=' +
                                  widget.documentid +
                                  '&amount=' +
                                  amount.toString() +
                                  '&email=' +
                                  widget.documentid +
                                  '@bloodwork.web.app&method=momo');
                        },
                        text: 'Mobile Money - GH¢' +
                            NumberFormat("###.0#", "en_US").format(amount),
                        icon: Icon(
                          Icons.mobile_friendly,
                          size: 20,
                        ),
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 50,
                          color: Colors.white,
                          textStyle: FlutterFlowTheme.subtitle2.override(
                            fontFamily: 'Lexend Deca',
                            color: Color(0xFF4E4E4E),
                          ),
                          elevation: 3,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: 10,
                        ),
                      ),
                    )
                  : SizedBox(height: 0),
              amount > 0
                  ? Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 24, 20, 0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          _launchURL(
                              context,
                              'https://bloodwork.web.app?id=' +
                                  widget.documentid +
                                  '&amount=' +
                                  amount.toString() +
                                  '&email=' +
                                  widget.documentid +
                                  '@bloodwork.web.app&method=card');
                        },
                        text: 'Debit Card - GH¢' +
                            NumberFormat("###.0#", "en_US").format(amount),
                        icon: Icon(
                          Icons.credit_card,
                          size: 20,
                        ),
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 50,
                          color: Colors.white,
                          textStyle: FlutterFlowTheme.subtitle2.override(
                            fontFamily: 'Lexend Deca',
                            color: Color(0xFF4E4E4E),
                          ),
                          elevation: 3,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: 10,
                        ),
                      ),
                    )
                  : SizedBox(height: 0),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 24, 20, 0),
                child: FFButtonWidget(
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CashPaymentWidget(),
                      ),
                    );
                  },
                  text: 'Cash Payment - GH¢' +
                      NumberFormat("###.0#", "en_US").format(amount),
                  icon: Icon(
                    Icons.money,
                    size: 20,
                  ),
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 50,
                    color: Colors.white,
                    textStyle: FlutterFlowTheme.subtitle2.override(
                      fontFamily: 'Lexend Deca',
                      color: Color(0xFF4E4E4E),
                    ),
                    elevation: 3,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: 10,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  updatePrice() {
    if (widget.test == "" || widget.test == null) {
      setState(() {
        amount = 0;
      });
    } else if (widget.test == "Example Test 1") {
      setState(() {
        amount = 100;
      });
    }
  }

  void _launchURL(BuildContext context, url) async {
    try {
      await launch(
        url,
        customTabsOption: CustomTabsOption(
          toolbarColor: Color(0xFF23894E),
          enableDefaultShare: false,
          enableUrlBarHiding: true,
          showPageTitle: false,
        ),
        safariVCOption: SafariViewControllerOption(
          preferredBarTintColor: Color(0xFF23894E),
          preferredControlTintColor: Colors.white,
          barCollapsingEnabled: true,
          entersReaderIfAvailable: false,
          dismissButtonStyle: SafariViewControllerDismissButtonStyle.close,
        ),
      );
    } catch (e) {
      // An exception is thrown if browser app is not installed on Android device.
      debugPrint(e.toString());
    }
  }
}
