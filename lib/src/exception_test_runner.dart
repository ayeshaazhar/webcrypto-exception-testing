import 'exception_test_group.dart';

/// Runs multiple test groups and generates reports
class ExceptionTestRunner {
  /// List of test groups to run
  final List<ExceptionTestGroup> testGroups;
  
  /// Optional platform information
  final String platform;

  ExceptionTestRunner({
    required this.testGroups,
    this.platform = 'unknown',
  });

  /// Run all test groups
  void runAll() {
    for (final group in testGroups) {
      group.runTests();
    }
  }
  
  /// Generate a simple report of test results
  /// Note: This is a placeholder - in a real implementation,
  /// you would capture test results and generate a report
  void generateReport() {
    print('Exception tests completed on platform: $platform');
    print('Total test groups: ${testGroups.length}');
    print('Total test cases: ${testGroups.fold<int>(0, (sum, group) => sum + group.testCases.length)}');
  }
}