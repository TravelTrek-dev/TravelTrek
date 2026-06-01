class Failures {
  final String errorMessage;

  Failures({required this.errorMessage});
}


class ServerFailure extends Failures {
  ServerFailure({required super.errorMessage});



 factory ServerFailure.fromJson(Map<String, dynamic> json) {
    return ServerFailure(
      errorMessage: json['message'] ?? 'An unknown error occurred',
    );
  } 

}