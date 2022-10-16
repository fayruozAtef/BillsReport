import 'package:bills_report/bills_report/data/repository/branch_repository.dart';
import 'package:bills_report/bills_report/domain/use_cases/get_branches_usecase.dart';
import 'package:bills_report/bills_report/domain/use_cases/get_report_summery_usecase.dart';
import 'package:bills_report/bills_report/presentation/controller/branch_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../bills_report/data/data_source/branch_remote_datasource.dart';
import '../../bills_report/domain/repository/basic_branch_repository.dart';
final serviceLocator=GetIt.instance;
class ServicesLocator{
  void init(){
    serviceLocator.registerFactory(() =>BranchBloc(serviceLocator(),serviceLocator()));


    /// USE CASES
    serviceLocator.registerLazySingleton(() => GetBranchesUseCase( basicBranchRepository: serviceLocator()));
    serviceLocator.registerLazySingleton(() => GetReportSummeryUserCase( basicBranchRepository: serviceLocator()));

    /// REPOSITORY
    serviceLocator.registerLazySingleton<BasicBranchRepository>(() => BranchRepository(basicBranchRemoteDataSource: serviceLocator()));


    /// DATA SOURCE
    serviceLocator.registerLazySingleton<BasicBranchRemoteDataSource>(() => BranchRemoteDataSource());

  }
}