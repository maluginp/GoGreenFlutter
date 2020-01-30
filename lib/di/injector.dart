import 'package:gogreen/core/http.dart';
import 'package:gogreen/services/services.dart';

class Injector {
  static final Injector _singleton = new Injector._internal();

  final IOrderService _orderService = OrderService();

  final Lazy<DenovoHttpClient> _denovoHttpClient = Lazy(() {
    return DenovoHttpClient(TokenService());
  });

  factory Injector() {
    return _singleton;
  }

  Injector._internal();

  ILogService get logService {
    return LogService();
  }

  ILocationService get locationService{
    return LocationService();
  }

  ITransactionService get transactionService {
    return TransactionService();
  }

  IStoreLocationsService get storeLocationsService {
    return StoreLocationsService();
  }

  IStoreService get storeService {
    return StoreService();
  }

  IOrderService get orderService {
    return _orderService;
  }

  IOrderHistoryService get orderHistoryService {
    return OrderHistoryService();
  }

  IAuthService get authService {
    return AuthService(denovoHttpClient, TokenService());
  }

  DenovoHttpClient get denovoHttpClient {
    return _denovoHttpClient.get();
  }

}

class Lazy<T> {
  final Function _func;
  bool _isEvaluated = false;
  Lazy(this._func);
  T _value;
  T get() {
    if(!_isEvaluated) {
      if(_func != null) {
        _value = _func();
      }
      _isEvaluated = true;
    }
    return _value;
  }
}