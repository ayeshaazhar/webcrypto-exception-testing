import 'package:test/test.dart';
import 'package:webcrypto/webcrypto.dart';
import 'package:webcrypto_exception_testing/exception_testing.dart';

void main() {
  group('RsaPssPrivateKey.generateKey Exception Tests', () {
    // Test invalid modulus length
    final invalidModulusTest = ExceptionTestCase(
      description: 'should throw ArgumentError for too small modulus length',
      operation: () => RsaPssPrivateKey.generateKey(
        512,                  // modulusLength (too small)
        BigInt.from(65537),   // publicExponent
        Hash.sha256,          // hash algorithm
      ),
      expectedExceptionType: ArgumentError,
      expectedMessagePattern: r'.*modulus length.*',
    );
    
    // Test invalid public exponent
    final invalidExponentTest = ExceptionTestCase(
      description: 'should throw ArgumentError for invalid public exponent',
      operation: () => RsaPssPrivateKey.generateKey(
        2048,               // modulusLength
        BigInt.from(2),     // publicExponent (not valid)
        Hash.sha256,        // hash algorithm
      ),
      expectedExceptionType: ArgumentError,
      expectedMessagePattern: r'.*public exponent.*',
    );
    
    // Run all tests
    final runner = ExceptionTestGroup(
      groupName: 'RsaPssPrivateKey.generateKey',
      testCases: [
        invalidModulusTest,
        invalidExponentTest,
      ],
    );
    
    runner.runTests();
  });
}