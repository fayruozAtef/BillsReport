import 'package:bills_report/bills_report/domain/entities/bills_report.dart';
import 'package:bills_report/bills_report/domain/entities/branch_details.dart';
import 'package:dartz/dartz.dart';
import '../../../core/error/failure.dart';
import '../use_cases/get_branch_details_usecase.dart';

abstract class BasicBranchRepository{
  Future<Either<Failure, BillsReport>> getBranches();
  Future<Either<Failure, BranchDetails>> getBranchDetails(GetBranchDetailsParameters parameter);

}