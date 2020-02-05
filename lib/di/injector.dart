import 'package:flutter/src/widgets/framework.dart';
import 'package:gogreen/core/http.dart';
import 'package:gogreen/services/services.dart';

class Injector {
  static final Injector _singleton = new Injector._internal();

  final IOrderService _orderService = OrderService();

  final Lazy<DenovoHttpClient> _denovoHttpClient = Lazy(() {
    return DenovoHttpClient(TokenService());
  });

  final Lazy<INavigationService> _navigationService = Lazy(() {
    return NavigationService();
  });

  factory Injector() {
    return _singleton;
  }

  Injector._internal();

  ILogService get logService {
    return LogService();
  }

  ILocationService get locationService{
    return LocationService(denovoHttpClient);
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

  IFileService fileService(BuildContext context) {
    return FileService(context);
  }

  IErrorService errorService(BuildContext context) {
    return ErrorService(context);
  }

  IAlertService alertService(BuildContext context) {
    return AlertService(context);
  }

  INavigationService get navigationService {
    return _navigationService.get();
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