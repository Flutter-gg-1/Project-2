import './global_variabels.dart';
import './dashboards/user_dashboard.dart';
import 'startapp.dart';

void main() {
  startApp();
  do {
    userDashboard();
  } while (!isExitMainPage);
}
