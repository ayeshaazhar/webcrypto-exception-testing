import 'package:test/test.dart';

/// Represents a single test case for exception testing
class ExceptionTestCase<T> {
  /// Description of what this test case is checking
  final String description;
  
  /// The operation that should throw an exception
  final Future<T> Function() operation;
  
  /// The expected type of exception
  final Type expectedExceptionType;
  
  /// Optional regex pattern to match against the exception message
  final String? expectedMessagePattern;

  ExceptionTestCase({
    required this.description,
    required this.operation,
    required this.expectedExceptionType,
    this.expectedMessagePattern,
  });

  /// Run this test case and verify the exception
  Future<void> run() async {
    try {
      await operation();
      fail('Expected $expectedExceptionType but no exception was thrown');
    } catch (e) {
      // Instead of using isA with a runtime type, we'll check the type directly
      expect(e.runtimeType == expectedExceptionType, isTrue,
          reason: '$description - expected $expectedExceptionType but got ${e.runtimeType}');
      
      if (expectedMessagePattern != null) {
        expect(
          e.toString(), 
          matches(expectedMessagePattern!),
          reason: '$description - message pattern mismatch'
        );
      }
      
      // Test passed
      return;
    }
  }
}