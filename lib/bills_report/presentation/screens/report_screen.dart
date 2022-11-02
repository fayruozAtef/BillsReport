import 'dart:async';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/cach_helper/cach_helper.dart';
import '../../../core/network/check_network_connection.dart';
import '../../../core/services/services_locator.dart';
import '../../../core/utils/app_constant.dart';
import '../components/report_summery.dart';
import '../controller/branch_bloc.dart';
import '../controller/branch_event.dart';
import '../components/data_table.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({Key? key}) : super(key: key);

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  bool flag=false;
  Future<void> checkConnection() async{
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        flag=true;
      }
    } on SocketException catch (_) {
      Fluttertoast.showToast(
          msg: "لا يوجد اتصال بالأنترنت برجاء الاتصال و المحاولة مرة أخرى",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 18.0
      );
    }
  }
  final bool? isArabic=CashHelper.getBoolData(key: isArabicLanguage);
  @override
  void initState() {
    super.initState();
    checkConnection();
    ConnectionUtil connectionStatus = ConnectionUtil.getInstance();
    connectionStatus.initialize();
    connectionStatus.connectionChange.listen((event) {
      if(event==true) {
        flag = event;
        setState(() {});
      }
      print(event);
    });
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => serviceLocator<BranchBloc>()..add(GetBranchEvent()),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
          child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height-170,
                    child: ListView(children: <Widget>[
                      Center(
                          child: Text(
                            (isArabic!)?'تقرير':"Reports",
                            style: GoogleFonts.acme(
                                fontSize: 30.0, fontWeight: FontWeight.w700),
                          )),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Container(
                          height: 2.0,
                          color: Colors.black45,
                        ),
                      ),
                      if(flag)
                        DataTableBody(),
                ]),
                  ),
                  const Spacer(),
                  if(flag)
                    ReportSummeryScreen(),
                ],
              )
          ),
        ),
      ),
    );
  }


}
