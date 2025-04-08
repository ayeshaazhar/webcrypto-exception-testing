
import 'package:test/test.dart';
import 'exception_test_case.dart';

/// Groups related exception test cases together
class ExceptionTestGroup {
  /// Name of this group of tests
  final String groupName;
  
  /// List of test cases in this group
  final List<ExceptionTestCase> testCases;

  ExceptionTestGroup({
    required this.groupName,
    required this.testCases,
  });

  /// Run all test cases in this group
  void runTests() {
    group(groupName, () {
      for (final testCase in testCases) {
        test(testCase.description, () => testCase.run());
      }
    });
  }
}