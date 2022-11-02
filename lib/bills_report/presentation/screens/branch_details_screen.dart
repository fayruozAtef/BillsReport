import 'dart:io';

import 'package:bills_report/bills_report/domain/entities/branch.dart';
import 'package:bills_report/bills_report/presentation/controller/branch_details_bloc.dart';
import 'package:bills_report/core/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../core/cach_helper/cach_helper.dart';
import '../../../core/services/services_locator.dart';
import '../../../core/utils/app_constant.dart';

class BranchDetailsScreen extends StatefulWidget {
  const BranchDetailsScreen({Key? key, required this.branch}) : super(key: key);
  final Branch branch;

  @override
  State<BranchDetailsScreen> createState() => _BranchDetailsScreenState();
}

class _BranchDetailsScreenState extends State<BranchDetailsScreen> {
  final bool? isArabic=CashHelper.getBoolData(key: isArabicLanguage);
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

  @override
  void initState() {
    super.initState();
    checkConnection();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => serviceLocator<BranchDetailsBloc>()
        ..add(GetBranchDetailsEvent(widget.branch.branchId)),
      child:Scaffold(
        appBar: AppBar(
            title: Text(
              widget.branch.name1,
              style: const TextStyle(color: Colors.black),
            ),
            backgroundColor: Colors.teal[200],
            iconTheme: const IconThemeData(color: Colors.black),
          ),
          body:  BlocBuilder<BranchDetailsBloc, BranchDetailsState>(
          builder: (context, state) {
            if(flag) {
              switch(state.branchDetailsState){
              case RequestState.loading:
                return const Center(child: CircularProgressIndicator(),);
              case RequestState.loaded:
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: DataTable(
                    showBottomBorder: true,
                    columns:  [
                      DataColumn(
                          numeric: false,
                          label: Text(
                              (isArabic!)?'القسم':"Department",
                              style:const TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.teal,),),),
                      DataColumn(
                          numeric: true,
                          label: Text(
                              (isArabic!)?'الأجمالى ':"Total",
                              style: const TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.teal,),),),
                      DataColumn(
                          numeric: true,
                          label: Text(
                              (isArabic!)?'الفواتير':"Bills",
                              style:const TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.teal,),),),
                    ],
                    rows: [
                      DataRow(
                          color: MaterialStateProperty.resolveWith<Color?>(
                                  (Set<MaterialState> states) {
                                return  HexColor('#c0efef');
                              }),
                          cells: [
                            DataCell(
                              Text((isArabic!)?'المبيعات':"Payment",style:const TextStyle(fontSize: 17.0),),
                            ),
                        DataCell(
                              Text(state.branchDetailsData!.salesAmount.toString()),
                            ),
                        DataCell(Center(child: Text(state.branchDetailsData!.numOfInvoicesSales.toString())))
                          ]),
                      DataRow(cells: [
                             DataCell(
                              Text((isArabic!)?'الضرائب':"Taxes",style: const TextStyle(fontSize: 17.0),),
                            ),
                        DataCell(
                              Text(state.branchDetailsData!.totalTaxes.toString()),
                            ),
                        DataCell(Center(child: Text(state.branchDetailsData!.numOfInvoicesTaxes.toString())))
                          ]),
                      DataRow(
                          color: MaterialStateProperty.resolveWith<Color?>(
                                  (Set<MaterialState> states) {
                                return HexColor('#c0efef');
                              }),
                          cells: [
                            DataCell(
                              Text((isArabic!)?'المرتجعات':"Returns",style: const TextStyle(fontSize: 17.0),),
                            ),
                        DataCell(
                              Text(state.branchDetailsData!.totalReturns.toString()),
                            ),
                        DataCell(Center(child: Text(state.branchDetailsData!.numOfInvoicesReturns.toString())))
                          ]),
                      DataRow(cells: [
                             DataCell(
                              Text((isArabic!)?'الخصم':"Discount",style: const TextStyle(fontSize: 17.0),),
                            ),
                        DataCell(
                              Text(state.branchDetailsData!.totalDis.toString()),
                            ),
                        DataCell(Center(child: Text(state.branchDetailsData!.numOfInvoicesDis.toString())))
                          ]),

                    ],
                  ),
                );
              case RequestState.error:
                return Expanded(child: Text(state.branchDetailsMessage));
            }
            }
            else {
              return const SizedBox();
            }
          },
        ),
      )
    );
  }

  Widget mySpace()=>const SizedBox(height: 25.0,);
}
