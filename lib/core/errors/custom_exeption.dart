class CustomExeption {
  final String errorMessage;
  const CustomExeption({required this.errorMessage});

  @override
  String toString() => errorMessage;
}
