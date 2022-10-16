import 'package:bills_report/bills_report/data/models/branch_model.dart';
import 'package:bills_report/bills_report/domain/entities/report_summery.dart';
import 'package:dio/dio.dart';

import '../../../core/error/exception.dart';
import '../../../core/network/api_constances.dart';
import '../../../core/network/error_message_model.dart';
import '../../domain/entities/bills_report.dart';
import '../models/bills_report_model.dart';
import '../models/report_summery_model.dart';

abstract class BasicBranchRemoteDataSource{
  Future<BillsReport> getBranches();
  Future<ReportSummery> getReportSummery();
}

class BranchRemoteDataSource extends BasicBranchRemoteDataSource{

  @override
  Future<BillsReport> getBranches() async {
    final response = await Dio().get(
      ApiConstance.getBranches,
    );

    if(response.statusCode==200){
      return BillsReportModel.fromJson(response.data);
    }else{
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<ReportSummery> getReportSummery() async{
    final response=await Dio().get(ApiConstance.getBranches);

    if(response.statusCode==200){
      return ReportSummeryModel.fromJson(response.data['item']);
    }else{
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }



}
