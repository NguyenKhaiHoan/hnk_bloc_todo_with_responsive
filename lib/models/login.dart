class Login {
  final String username;
  final String password;

  const Login({
    required this.username,
    required this.password,
  });

  Login copyWith({
    String? username,
    String? password,
  }) {
    return Login(
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }
}
