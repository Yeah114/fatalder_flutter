import 'package:flutter/foundation.dart';
import '../generated/fatalder.pb.dart';

class AppState with ChangeNotifier {
  bool _isConnected = false;
  bool _isLoading = false;
  String? _error;

  List<ServerConfig> _serverConfigs = [];
  List<String> _taskGroups = [];
  FrameworkConfig? _frameworkConfig;

  // Getters
  bool get isConnected => _isConnected;
  bool get isLoading => _isLoading;
  String? get error => _error;
  List<ServerConfig> get serverConfigs => _serverConfigs;
  List<String> get taskGroups => _taskGroups;
  FrameworkConfig? get frameworkConfig => _frameworkConfig;

  // Setters
  void setConnected(bool value) {
    _isConnected = value;
    notifyListeners();
  }

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void setError(String? value) {
    _error = value;
    notifyListeners();
  }

  void setServerConfigs(List<ServerConfig> configs) {
    _serverConfigs = configs;
    notifyListeners();
  }

  void setTaskGroups(List<String> groups) {
    _taskGroups = groups;
    notifyListeners();
  }

  void setFrameworkConfig(FrameworkConfig? config) {
    _frameworkConfig = config;
    notifyListeners();
  }

  void clearError() {
    _error = null;
    notifyListeners();
  }
}
