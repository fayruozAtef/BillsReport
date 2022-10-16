import 'package:bills_report/bills_report/domain/entities/branch.dart';
import 'package:bills_report/bills_report/presentation/screens/branch_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/services/services_locator.dart';
import '../components/report_summery.dart';
import '../controller/branch_bloc.dart';
import '../controller/branch_event.dart';
import '../components/data_table.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({Key? key}) : super(key: key);
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
                            'تقرير',
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
                      DataTableBody(),


                    ]),
                  ),
                  const Spacer(),
                  ReportSummeryScreen(),
                ],
              )
          ),
        ),
      ),
    );
  }


}
