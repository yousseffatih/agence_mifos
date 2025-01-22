import 'package:agence_mifos/route/routes.dart';
import 'package:agence_mifos/screens/center/center_bindings.dart';
import 'package:agence_mifos/screens/center/center_screen.dart';
import 'package:agence_mifos/screens/charges_loan/charge_loan_bindings.dart';
import 'package:agence_mifos/screens/charges_loan/charge_loan_screen.dart';
import 'package:agence_mifos/screens/client/client_bindings.dart';
import 'package:agence_mifos/screens/client/client_screen.dart';
import 'package:agence_mifos/screens/clients/clients_bindings.dart';
import 'package:agence_mifos/screens/clients/clients_screen.dart';
import 'package:agence_mifos/screens/document_loan/document_loan_bindings.dart';
import 'package:agence_mifos/screens/document_loan/document_loan_screen.dart';
import 'package:agence_mifos/screens/group/group_bindings.dart';
import 'package:agence_mifos/screens/group/group_screen.dart';
import 'package:agence_mifos/screens/loan_account/loan_account_binding.dart';
import 'package:agence_mifos/screens/loan_account/loan_account_screen.dart';
import 'package:agence_mifos/screens/navigation_bar/main_navigation_bar.dart';
import 'package:agence_mifos/screens/navigation_bar/navigation_bindings.dart';
import 'package:agence_mifos/screens/repayement_sch_loan/repayement_sch_loan_screen.dart';
import 'package:agence_mifos/screens/repayement_sch_loan/repayment_sch_loan_bindings.dart';
import 'package:agence_mifos/screens/sing_In/sing_in_screen.dart';
import 'package:agence_mifos/screens/test/text_screen.dart';
import 'package:agence_mifos/screens/transactions_loan/transactions_bindings.dart';
import 'package:agence_mifos/screens/transactions_loan/transactions_screen.dart';
import 'package:get/get.dart';

import '../screens/sing_In/sing_in_bindings.dart';
import 'auth_midelware.dart';

class AppPage {
  static final List<GetPage<dynamic>> pages = [
    GetPage(
          name: AppRoute.signIn,
          page: () => const SignUpScreen(),
          binding: SingInBindings(),
          middlewares: [AuthMiddleware()]
        ),
    GetPage(
          name: AppRoute.home,
          page: () =>  MainPage(),
          binding: NavigationBinding(),
        ),
    GetPage(
          name: AppRoute.clients,
          page: () =>  ClientsScreen(),
          binding: ClientsBindings(),
        ),
    GetPage(
          name: AppRoute.clientByID,
          page: () =>  ClientScreen(),
          binding: ClientBindings(),
        ),
    GetPage(
          name: AppRoute.test,
          page: () =>  TestScreen(),
        ),
    GetPage(
          name: AppRoute.centerByID,
          page: () =>  CenterScreen(),
          binding: CenterBindings()
        ),
    GetPage(
          name: AppRoute.groupByID,
          page: () =>  GroupScreen(),
          binding: GroupBindings()
        ),
    GetPage(
          name: AppRoute.loanAccount,
          page: () =>  LoanAccountScreen(),
          binding: LoanAccountBinding()
        ),
    GetPage(
          name: AppRoute.transaction,
          page: () =>  TransactionsScreen(),
          binding: TransactionsBindings()
        ),
    GetPage(
          name: AppRoute.repayemntSch,
          page: () =>  RepayementSchLoanScreen(),
          binding: RepaymentSchLoanBindings()
        ),
    GetPage(
          name: AppRoute.document,
          page: () =>  DocumentLoanScreen(),
          binding: DocumentLoanBindings()
        ),
    GetPage(
          name: AppRoute.chargeLoan,
          page: () =>  ChargeLoanScreen(),
          binding: ChargeLoanBindings()
        ),
  ];
}