class SignupemailpasswordFailure {
  final String message;

  const SignupemailpasswordFailure(
      [this.message = "An unknown error occured."]);

  factory SignupemailpasswordFailure.code(String code) {
    switch (code) { 
      case 'weak-password':
        return const SignupemailpasswordFailure(
            'Please enter a stronger password');
      case 'invalid-email':
        return const SignupemailpasswordFailure('Invalid Email');
      case 'email-already-in-use':
        return const SignupemailpasswordFailure(
            'Email already used for an account');
      case 'operation-not-allowed':
        return const SignupemailpasswordFailure(
            'Operation is not allowed! Please contact support');
      case 'user-disabled':
        return const SignupemailpasswordFailure(
            'User is disabled! Please contact support');
      default:
        return const SignupemailpasswordFailure();
      // SignupemailpasswordFailure('Technical issue occurred! Contact support');
    }
  }
}
