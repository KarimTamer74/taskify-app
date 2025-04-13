abstract class Failure {
 final String message;
 final int statusCode;


 Failure(this.message, this.statusCode);
}


class ServerFailure extends Failure {
 ServerFailure([super.message = 'Server Error', super.statusCode = 500]);
}


class CacheFailure extends Failure {
 CacheFailure([super.message = 'Cache Error', super.statusCode = 500]);
}
// Add more failures as needed


