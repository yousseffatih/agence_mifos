import 'package:agence_mifos/screens/document_savingAccount_client/document_savingAccount_bindings.dart';
import 'package:agence_mifos/screens/document_savingAccount_client/document_savingAccount_screen.dart';
import 'package:agence_mifos/screens/group_list_center/group_list_center_bindings.dart';
import 'package:agence_mifos/screens/group_list_center/group_list_center_screen.dart';
import 'package:agence_mifos/screens/notes_client/notes_client_bindings.dart';
import 'package:agence_mifos/screens/notes_client/notes_client_screen.dart';
import 'package:agence_mifos/screens/pinpoint_client/pinpoint_client_bindings.dart';
import 'package:agence_mifos/screens/pinpoint_client/pinpoint_client_screen.dart';
import 'package:agence_mifos/screens/saving_account_client/saving_account_bindings.dart';
import 'package:agence_mifos/screens/saving_account_client/saving_account_screen.dart';
import 'package:agence_mifos/screens/upload_signature/upload_signature_bindings.dart';
import 'package:agence_mifos/screens/upload_signature/upload_signature_screen.dart';
import 'package:get/get.dart';

import '../screens/add_loan_account/add_loan_account_bindings.dart';
import '../screens/add_loan_account/add_loan_account_screen.dart';
import '../screens/add_saviing_account/add_saving_account_bindings.dart';
import '../screens/add_saviing_account/add_saving_account_screen.dart';
import '../screens/center/center_bindings.dart';
import '../screens/center/center_screen.dart';
import '../screens/charges_client/charges_client_bindings.dart';
import '../screens/charges_client/charges_client_screen.dart';
import '../screens/charges_loan/charge_loan_bindings.dart';
import '../screens/charges_loan/charge_loan_screen.dart';
import '../screens/client/client_bindings.dart';
import '../screens/client/client_screen.dart';
import '../screens/clients/clients_bindings.dart';
import '../screens/clients/clients_screen.dart';
import '../screens/document_client/document_client_bindings.dart';
import '../screens/document_client/document_client_screen.dart';
import '../screens/document_loan/document_loan_bindings.dart';
import '../screens/document_loan/document_loan_screen.dart';
import '../screens/group/group_bindings.dart';
import '../screens/group/group_screen.dart';
import '../screens/identifier_client/identifier_client_bindings.dart';
import '../screens/identifier_client/indetifier_client_screen.dart';
import '../screens/loan_account/loan_account_binding.dart';
import '../screens/loan_account/loan_account_screen.dart';
import '../screens/navigation_bar/main_navigation_bar.dart';
import '../screens/navigation_bar/navigation_bindings.dart';
import '../screens/repayement_sch_loan/repayement_sch_loan_screen.dart';
import '../screens/repayement_sch_loan/repayment_sch_loan_bindings.dart';
import '../screens/sing_In/sing_in_bindings.dart';
import '../screens/sing_In/sing_in_screen.dart';
import '../screens/surveys/surveys_client_bindings.dart';
import '../screens/surveys/surveys_client_screen.dart';
import '../screens/test/test_binding.dart';
import '../screens/test/text_screen.dart';
import '../screens/transactions_loan/transactions_bindings.dart';
import '../screens/transactions_loan/transactions_screen.dart';
import 'auth_midelware.dart';
import 'routes.dart';

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
          binding: TestBinding(),
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
    GetPage(
          name: AppRoute.addLoan,
          page: () =>  AddLoanAccountScreen(),
          binding: AddLoanAccountBindings()
        ),
    GetPage(
          name: AppRoute.addSavingAccount,
          page: () =>  AddSavingAccountScreen(),
          binding: AddSavingAccountBindings()
        ),
    GetPage(
          name: AppRoute.chargesClient,
          page: () =>  ChargesClientScreen(),
          binding: ChargesClientBindings()
        ),
    GetPage(
          name: AppRoute.documentClient,
          page: () =>  DocumentClientScreen(),
          binding: DocumentClientBindings()
        ),
    GetPage(
          name: AppRoute.identifierClient,
          page: () =>  IdnetifierClientScreen(),
          binding: IdentifierClientBindings()
        ),
    GetPage(
          name: AppRoute.survery,
          page: () =>  SurveysClientScreen(),
          binding: SurveysClientBindings()
        ),
    GetPage(
          name: AppRoute.pinpointClient,
          page: () =>  PinpointClientScreen(),
          binding: PinpointClientBindings()
        ),
    GetPage(
          name: AppRoute.uploadSignature,
          page: () =>  UploadSignatureScreen(),
          binding: UploadSignatureBindings()
        ),
    GetPage(
          name: AppRoute.notesClient,
          page: () =>  NotesClientScreen(),
          binding: NotesClientBindings()
        ),
    GetPage(
          name: AppRoute.savingAccountClient,
          page: () =>  SavingAccountScreen(),
          binding: SavingAccountBindings()
        ),
    GetPage(
          name: AppRoute.documentSavingAccountClient,
          page: () =>  DocumentSavingaccountScreen(),
          binding: DocumentSavingaccountBindings()
        ),
    GetPage(
          name: AppRoute.groupListCenter,
          page: () =>  GroupListCenterScreen(),
          binding: GroupListCenterBindings()
        ),
  ];
}