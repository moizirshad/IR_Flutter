abstract class WebServiceResponseLisener<T> {
  void ResponseSuccess(T result);

  void ResponseFailure(String s);
}
