import 'package:bills_report/bills_report/domain/entities/bills_report.dart';
import 'package:bills_report/bills_report/domain/entities/branch.dart';
import 'package:bills_report/bills_report/domain/entities/report_summery.dart';
import 'package:dartz/dartz.dart';
import '../../../core/error/failure.dart';

abstract class BasicBranchRepository{
  Future<Either<Failure, BillsReport>> getBranches();
  Future<Either<Failure, ReportSummery>> getReportSummery();

}