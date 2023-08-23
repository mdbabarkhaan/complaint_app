import 'package:police_complaint_app/controllers/complaint_controller.dart';
import 'package:police_complaint_app/controllers/login_controller.dart';
import 'package:police_complaint_app/controllers/signup_controller.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providersController = [
  ChangeNotifierProvider.value(value: SignupController()),
  ChangeNotifierProvider.value(value: LoginController()),
  ChangeNotifierProvider.value(value: ComplaintController()),
];