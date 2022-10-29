import 'package:bills_report/bills_report/data/models/branch_model.dart';
import 'package:bills_report/bills_report/domain/entities/branch_details.dart';
import 'package:bills_report/bills_report/domain/entities/report_summery.dart';
import 'package:dio/dio.dart';

import '../../../core/error/exception.dart';
import '../../../core/network/api_constances.dart';
import '../../../core/network/error_message_model.dart';
import '../../domain/entities/bills_report.dart';
import '../../domain/use_cases/get_branch_details_usecase.dart';
import '../models/bills_report_model.dart';
import '../models/branch_details_model.dart';


abstract class BasicBranchRemoteDataSource{
  Future<BillsReport> getBranches();
  Future<BranchDetails> getBranchDetails(GetBranchDetailsParameters parameters);

}

class BranchRemoteDataSource extends BasicBranchRemoteDataSource{

  static Dio dio =Dio();
  @override
  Future<BillsReport> getBranches() async {
    dio.options.headers =
    {
      'APIKey': ApiConstance.apiKey,
    };
    final response = await dio.get(
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
  Future<BranchDetails> getBranchDetails(GetBranchDetailsParameters parameters) async{
    dio.options.headers =
    {
      'APIKey': ApiConstance.apiKey,
    };
    final response=await dio.get(ApiConstance.getBranchDetails(parameters.branchId));

    if(response.statusCode==200){
      return BranchDetailsModel.fromJson(response.data);
    }else{
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }



}
