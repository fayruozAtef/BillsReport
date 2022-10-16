import 'package:bills_report/bills_report/domain/entities/branch.dart';
import 'package:bills_report/bills_report/domain/repository/basic_branch_repository.dart';
import 'package:bills_report/core/error/failure.dart';
import 'package:bills_report/core/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

import '../entities/bills_report.dart';

class GetBranchesUseCase extends BaseUseCase<BillsReport,NoParameters>{

  final BasicBranchRepository basicBranchRepository;

  GetBranchesUseCase({
    required this.basicBranchRepository,
  });

  @override
  Future<Either<Failure,BillsReport>> call(NoParameters parameters) async{
    return await basicBranchRepository.getBranches();
  }

}