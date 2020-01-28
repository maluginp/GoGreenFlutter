import 'package:gogreen/services/services.dart';

class Injector {
  static final Injector _singleton = new Injector._internal();

  static final IOrderService _orderService = OrderService();

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
}