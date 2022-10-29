class ApiConstance{
  static const String baseUrl="http://scopos-rotana.online";
  static const String getBranches="$baseUrl/api/Reports/GetSummryReport";
  static const apiKey ="TBI@2022";

  static String getBranchDetails(int branchId) =>
      "$baseUrl/api/Reports/GetSummryByID?BranchID=$branchId";
}
