import 'package:bills_report/bills_report/data/data_source/branch_remote_datasource.dart';
import 'package:bills_report/bills_report/domain/entities/bills_report.dart';
import 'package:bills_report/bills_report/domain/entities/branch.dart';
import 'package:bills_report/bills_report/domain/entities/report_summery.dart';
import 'package:bills_report/bills_report/domain/repository/basic_branch_repository.dart';
import 'package:bills_report/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import '../../../core/error/exception.dart';

class BranchRepository extends BasicBranchRepository{

  final BasicBranchRemoteDataSource basicBranchRemoteDataSource;

  BranchRepository({
    required this.basicBranchRemoteDataSource,
  });

  @override
  Future<Either<Failure, BillsReport>> getBranches() async{
    final result =await basicBranchRemoteDataSource.getBranches();
    try{
      return Right(result);
    }on ServerException catch(fail){
      return Left(ServerFailure(message: fail.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, ReportSummery>> getReportSummery() async{
    final result =await basicBranchRemoteDataSource.getReportSummery();
    try{
      return Right(result);
    }on ServerException catch(fail){
      return Left(ServerFailure(message: fail.errorMessageModel.statusMessage));
    }
  }


}