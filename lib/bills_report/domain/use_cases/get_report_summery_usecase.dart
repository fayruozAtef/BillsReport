import 'package:bills_report/bills_report/domain/entities/report_summery.dart';
import 'package:bills_report/bills_report/domain/repository/basic_branch_repository.dart';
import 'package:bills_report/core/error/failure.dart';
import 'package:bills_report/core/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

class GetReportSummeryUserCase extends BaseUseCase<ReportSummery,NoParameters>{

  final BasicBranchRepository basicBranchRepository;
 
  GetReportSummeryUserCase({
    required this.basicBranchRepository,
  });

  @override
  Future<Either<Failure, ReportSummery>> call(NoParameters parameters) async{
    return await basicBranchRepository.getReportSummery();
  }

}