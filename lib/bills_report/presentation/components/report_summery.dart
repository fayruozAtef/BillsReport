import 'package:bills_report/bills_report/presentation/controller/branch_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/cach_helper/cach_helper.dart';
import '../../../core/utils/app_constant.dart';
import '../controller/branch_bloc.dart';

class ReportSummeryScreen extends StatelessWidget {
   ReportSummeryScreen({super.key});
  final bool? isArabic=CashHelper.getBoolData(key: isArabicLanguage);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BranchBloc,BranchState>(
      buildWhen: (previous, current)=>previous.reportSummeryState!=current.reportSummeryState,
      builder: (context , state){
        return Container(
          width: MediaQuery.of(context).size.width,
          height: 120.0,
          decoration: BoxDecoration(
            color: Colors.teal[100],
            borderRadius: BorderRadius.circular(20.0),
            border: Border.all(color: Colors.black),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Text(
                          (isArabic!)?'إجمالى عدد الفواتير : ':"Total number of bills: ",
                          style: GoogleFonts.abrilFatface(fontSize: 20.0)),
                      const SizedBox(width: 10.0,),
                      Text('${state.reportSummery.totalNumberOfInvoices}',
                          style: GoogleFonts.abrilFatface(fontSize: 16.0)),
                    ],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: [
                      Text(
                          (isArabic!)?'إجمالى المبيعات : ':"Total payment : ",
                          style: GoogleFonts.abrilFatface(fontSize: 20.0)),

                      const SizedBox(width: 10.0,),
                      Text('${state.reportSummery.totalSalesAmount}',
                          style: GoogleFonts.abrilFatface(fontSize: 16.0)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
