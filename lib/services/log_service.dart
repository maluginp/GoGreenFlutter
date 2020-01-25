abstract class ILogService {
  void d(String log);
}

class LogService implements ILogService {
  @override
  void d(String log) {
    print(log);
  }
}