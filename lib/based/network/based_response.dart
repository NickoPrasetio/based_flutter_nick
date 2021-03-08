class BasedResponse<T> {
  BasedResponse(this.content);

  int status;
  ErrorData errorData;
  T content;

  T getData() {
    return content;
  }

  void setData(T content) {
    this.content = content;
  }

  ErrorData getError() {
    return errorData;
  }
}

class Success extends BasedResponse {
  Success(contentFromApi) : super(null) {
    content = contentFromApi;
  }
}

class Error extends BasedResponse {
  Error(ErrorData errorDataFromApi) : super(null) {
    errorData = errorDataFromApi;
  }
}

class ErrorData {
  int errorCode = 0;
  String errorMessage = '';

  ErrorData(this.errorMessage, this.errorCode);
}
