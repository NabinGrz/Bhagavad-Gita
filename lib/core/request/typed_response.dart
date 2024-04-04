class DataResponse<T> {
  Status status;
  T? data;
  String? message;
  String? modelType;
  int responseStatus;

  DataResponse.loading(this.message)
      : status = Status.loading,
        responseStatus = 0;

  DataResponse.success(this.data, {this.modelType})
      : status = Status.success,
        responseStatus = 0;

  DataResponse.error(this.message, [int statusCode = 0])
      : status = Status.error,
        responseStatus = statusCode;

  DataResponse.connectivityError()
      : status = Status.connectivityError,
        responseStatus = 0;

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }
}

enum Status { loading, success, error, connectivityError }
