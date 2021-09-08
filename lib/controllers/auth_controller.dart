import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kolay_wms_mobile/utils/root.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  var _firebaseUser = FirebaseAuth.instance.currentUser.obs;
  var launch = true.obs;
  var checkDone = false.obs;

  User? get user => _firebaseUser.value;

  @override
  // ignore: must_call_super
  onInit() async {
    _firebaseUser.bindStream(_auth.authStateChanges());
    launch.value = await checkFirstSeen();
  }

  Future<bool> checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    launch.value = prefs.getBool("launch") ?? true;
    if (launch.value == true) {
      await prefs.setBool('launch', false);
    }
    print(launch.value);
    checkDone.value = true;
    return launch.value;
  }

  void createUser(String email, String password) async {
    try {
      // ignore: unused_local_variable
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      await _auth.signOut();

      Get.offAll(Root());
      Get.snackbar(
        "success".tr,
        "sign_up_success".tr,
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      Get.snackbar(
        "error".tr,
        "sign_up_error".tr,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<UserCredential?> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      Get.snackbar(
        "error".tr,
        "google_error".tr,
        snackPosition: SnackPosition.BOTTOM,
      );
      return null;
    }
  }

  Future<void> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      Get.snackbar(
        "success".tr,
        "forgot_password_success".tr,
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      Get.snackbar(
        "error".tr,
        "google_error".tr,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void login(String email, String password) async {
    try {
      // ignore: unused_local_variable
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      Get.snackbar(
        "error".tr,
        "login_error".tr,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      Get.snackbar(
        "error".tr,
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
