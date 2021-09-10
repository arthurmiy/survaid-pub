import 'package:capimobile/features/repository/data/model/camera_model.dart';
import 'package:capimobile/features/repository/data/model/survey_data_model.dart';
import 'package:capimobile/features/repository/data/model/user_model.dart';
import 'package:capimobile/features/repository/domain/entities/camera_entity.dart';
import 'package:capimobile/features/repository/domain/entities/survey_data_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class FireBaseRemoteDataSource {
  Future<void> signUp(String email, String password, String userName);
  Future<UserModel> signIn(String email, String password, String method);
  Future<bool> isSignIn();
  Future<void> signOut();
  Future<String> getCurrentUid();
  Stream<List<SurveyDataModel>> getSurveys();
  Future<void> resendConfirmationEmail(String email, String password);

  Future<void> getCreateCurrentUser(
      String email, String imgUrl, String userName);
  Stream<List<CameraModel>> getCameras();
  Future<UserModel> getLoggedUser();
  Future<void> appendNewSurvey(SurveyDataEntity survey);
  Future<void> appendNewCamera(CameraEntity camera);
  Future<void> deleteCamera(String cameraName);
  Future<void> deleteSurvey(String surveyName);
  Stream<UserModel> listenUserEvents();
}

class FireBaseRemoteDataSourceImpl implements FireBaseRemoteDataSource {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _userCollection = FirebaseFirestore.instance.collection("users");
  String userId;

  @override
  Future<void> signUp(String email, String password, String userName) async {
    String oldId;
    //saves old id
    if (_auth.currentUser != null) {
      ///////////upgrade to logged user
      //get anonymous user login
      oldId = _auth.currentUser.uid;
      //delete anonymous user
      await _auth.currentUser.delete();
    }

    UserCredential cred = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);

    await cred.user.updateProfile(displayName: userName);
    await cred.user.sendEmailVerification();
    await getCreateCurrentUser(email, null, userName);

    await signOut();
    //copy old data
    if (oldId != null) {
      _deleteAndtransferDataFromOldId(oldId);
    }
  }

  @override
  Future<void> appendNewCamera(CameraEntity camera) async {
    //verify if logged
    bool isLogged = await isSignIn();
    if (isLogged) {
      //append camera
      //enforces user creation
      await getCreateCurrentUser(null, null, null);

      //saves camera
      _userCollection
          .doc(_auth.currentUser.uid)
          .collection("camera")
          .where('name', isEqualTo: camera.name)
            ..get().then((surv) {
              if (surv.docs.length > 0) {
                //update
                final newCamera = CameraModel.fromEntity(camera).toDocument();
                _userCollection
                    .doc(_auth.currentUser.uid)
                    .collection("camera")
                    .doc(surv.docs[0].id)
                    .update(newCamera);
                print("User inserted");
                return;
              } else {
                final newCamera = CameraModel.fromEntity(camera).toDocument();
                _userCollection
                    .doc(_auth.currentUser.uid)
                    .collection("camera")
                    .add(newCamera);
                return;
              }
            });
    } else {
      //signIn anonymously
      await signIn(null, null, null);
      //append camera to anonymous user account
      await appendNewCamera(camera);
    }
  }

  @override
  Future<void> appendNewSurvey(SurveyDataEntity survey) async {
    SurveyDataEntity survey2;

    //verify if logged
    bool isLogged = await isSignIn();
    if (isLogged) {
      //append camera
      //enforces user creation
      await getCreateCurrentUser(null, null, null);

      survey2 = survey.copyWith(userId: _auth.currentUser.uid);

      //saves Survey
      _userCollection.doc(_auth.currentUser.uid).collection("survey").where(
          'surveyName',
          isEqualTo: survey2.surveyName)
        ..get().then((surv) {
          if (surv.docs.length > 0) {
            //update
            final newSurvey = SurveyDataModel.fromEntity(survey2).toDocument();
            _userCollection
                .doc(_auth.currentUser.uid)
                .collection("survey")
                .doc(surv.docs[0].id)
                .update(newSurvey);
            print("User inserted");
            return;
          } else {
            final newSurvey = SurveyDataModel.fromEntity(survey2).toDocument();
            _userCollection
                .doc(_auth.currentUser.uid)
                .collection("survey")
                .add(newSurvey);
            return;
          }
        });
    } else {
      //signIn anonymously
      await signIn(null, null, null);
      //append camera to anonymous user account
      await appendNewSurvey(survey);
    }
  }

  @override
  Future<UserModel> getLoggedUser() async {
    bool isLogged = _auth.currentUser != null;
    if (isLogged) {
      final userSnapshot =
          await _userCollection.doc(_auth.currentUser.uid).get();
      return UserModel.fromSnapshot(userSnapshot);
    } else {
      //signIn anonymously
      await signIn(null, null, null).then((value) => null);
      //create user in firebase
      await getCreateCurrentUser(null, null, null);
      return UserModel(
          name: '', email: '', imageUrl: '', uid: _auth.currentUser.uid);
    }
  }

  @override
  Stream<List<CameraModel>> getCameras() async* {
    var stream;
    bool isLogged = _auth.currentUser != null;
    if (isLogged) {
      stream = _userCollection
          .doc(_auth.currentUser.uid)
          .collection("camera")
          .orderBy("name")
          .snapshots()
          .map((querySnapshot) => querySnapshot.docs
              .map((docSnapshot) => CameraModel.fromSnapshot(docSnapshot))
              .toList());
    } else {
      //signIn anonymously
      await signIn(null, null, null).then((value) => null);
      //append camera to anonymous user account
      stream = _userCollection
          .doc(_auth.currentUser.uid)
          .collection("camera")
          .orderBy("name")
          .snapshots()
          .map((querySnapshot) => querySnapshot.docs
              .map((docSnapshot) => CameraModel.fromSnapshot(docSnapshot))
              .toList());
    }
    await for (var event in stream) {
      yield event;
    }
  }

  @override
  Future<void> getCreateCurrentUser(
      String email, String profileUrl, String userName) async {
//get current user in firebase and if it doesnt exist creates
    _userCollection.doc(_auth.currentUser.uid).get().then((user) {
      if (!user.exists) {
        final newUser = UserModel(
          name: userName ?? '',
          email: email ?? '',
          uid: _auth.currentUser.uid,
          imageUrl: profileUrl ?? '',
        ).toDocument();
        _userCollection.doc(_auth.currentUser.uid).set(newUser);
        print("User inserted");
        return;
      } else {
        print("User Already exists");
        return;
      }
    });
  }

  @override
  Stream<List<SurveyDataModel>> getSurveys() async* {
    var stream;
    bool isLogged = _auth.currentUser != null;
    if (isLogged) {
      stream = _userCollection
          .doc(_auth.currentUser.uid)
          .collection("survey")
          .orderBy("time")
          .snapshots()
          .map((querySnapshot) => querySnapshot.docs
              .map((docSnapshot) => SurveyDataModel.fromSnapshot(docSnapshot))
              .toList());
    } else {
      //signIn anonymously
      await signIn(null, null, null).then((value) => null);
      //append camera to anonymous user account
      stream = _userCollection
          .doc(_auth.currentUser.uid)
          .collection("survey")
          .orderBy("time")
          .snapshots()
          .map((querySnapshot) => querySnapshot.docs
              .map((docSnapshot) => SurveyDataModel.fromSnapshot(docSnapshot))
              .toList());
    }
    await for (var event in stream) {
      yield event;
    }
  }

  @override
  Future<String> getCurrentUid() async => _auth.currentUser.uid;

  @override
  Future<void> signOut() async {
    await _auth.signOut();
  }

  @override
  Future<bool> isSignIn() async => _auth.currentUser != null;

  @override
  Future<UserModel> signIn(String email, String password, String method) async {
    //method - can be google login (google), email (email) login from anonymous user with deletion or merge
    if (email == null && method != 'google') {
      await _auth.signInAnonymously();
      return UserModel(email: 'anonymous@anonymous');
    } else {
      String tmp;
      String oldId;
      //saves old id
      if (_auth.currentUser != null) {
        ///////////upgrade to logged user
        //get anonymous user login
        oldId = _auth.currentUser.uid;
        //delete anonymous user
        await _auth.currentUser.delete();
      }
      //select proper login method
      if (method == 'google') {
        tmp = await signInWithGoogle();
      } else {
        tmp = await _signInWithEmailAndPassword(email, password);
      }
      if (tmp == 'verify') {
        await signOut();
      }

      //copy old data
      if (oldId != null) {
        _deleteAndtransferDataFromOldId(oldId);
      }
      //verify if login was successful
      if (tmp != null) {
        return UserModel(email: tmp);
      } else {
        return UserModel(email: 'error');
      }
    }
  }

  Future<void> _deleteAndtransferDataFromOldId(String oldId) async {
    if (_auth.currentUser != null) {
      //save previous cameras under the new login
      QuerySnapshot cameras =
          await _userCollection.doc(oldId).collection("camera").get();
      for (var i = 0; i < cameras.docs.length; i++) {
        appendNewCamera(CameraModel.fromSnapshot(cameras.docs[i]));
      }

      //save previous surveys under the new login
      QuerySnapshot surveys =
          await _userCollection.doc(oldId).collection("survey").get();
      for (var i = 0; i < surveys.docs.length; i++) {
        appendNewSurvey(SurveyDataModel.fromSnapshot(surveys.docs[i]));
      }

      //delete anonymous data
      _userCollection.doc(oldId).delete();
    } else {
      //signIn anonymously
      await signIn(null, null, null);
      //append camera to anonymous user account
      await _deleteAndtransferDataFromOldId(oldId);
    }
  }

  Future<String> _signInWithEmailAndPassword(
      String email, String password) async {
    var result = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    final User user = result.user;

    if (!(user != null)) return null;
    if (!(await user.getIdToken() != null)) return null;

    final User currentUser = _auth.currentUser;
    if (!(user.uid == currentUser.uid)) return null;

    if (!user.emailVerified) return 'verify';

    print('signInEmail succeeded: $user');

    return user.email;
  }

  Future<String> signInWithGoogle() async {
    final GoogleSignInAccount googleSignInAccount =
        await GoogleSignIn().signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    // final AuthCredential credential = GoogleAuthProvider.credential(
    //   accessToken: googleSignInAuthentication.accessToken,
    //   idToken: googleSignInAuthentication.idToken,
    // );

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final UserCredential authResult =
        await _auth.signInWithCredential(credential);
    final User user = authResult.user;

    if (user != null) {
      if (!(!user.isAnonymous)) return null;
      if (!(await user.getIdToken() != null)) return null;

      final User currentUser = _auth.currentUser;
      if (!(user.uid == currentUser.uid)) return null;

      print('signInWithGoogle succeeded: $user');
      getCreateCurrentUser(user.email, user.photoURL, user.displayName);
      return user.email;
    }

    return null;
  }

  @override
  Future<void> deleteCamera(String cameraName) async {
    //verify if logged
    bool isLogged = await isSignIn();
    if (isLogged) {
      //append camera
      //enforces user creation
      await getCreateCurrentUser(null, null, null);

      //saves Survey
      _userCollection
          .doc(_auth.currentUser.uid)
          .collection("camera")
          .where('name', isEqualTo: cameraName)
            ..get().then((surv) {
              if (surv.docs.length > 0) {
                //delete
                _userCollection
                    .doc(_auth.currentUser.uid)
                    .collection("camera")
                    .doc(surv.docs[0].id)
                    .delete();
                print("camera deleted");
                return;
              } else {
                print("noCamerasfound");
                return;
              }
            });
    } else {
      //signIn anonymously
      await signIn(null, null, null);
      //append camera to anonymous user account
      await deleteCamera(cameraName);
    }
  }

  @override
  Future<void> deleteSurvey(String surveyName) async {
    //verify if logged
    bool isLogged = await isSignIn();
    if (isLogged) {
      //append camera
      //enforces user creation
      await getCreateCurrentUser(null, null, null);

      //saves Survey
      _userCollection
          .doc(_auth.currentUser.uid)
          .collection("survey")
          .where('surveyName', isEqualTo: surveyName)
            ..get().then((surv) {
              if (surv.docs.length > 0) {
                //delete
                _userCollection
                    .doc(_auth.currentUser.uid)
                    .collection("survey")
                    .doc(surv.docs[0].id)
                    .delete();
                print("survey deleted");
                return;
              } else {
                print("noSurveysfound");
                return;
              }
            });
    } else {
      //signIn anonymously
      await signIn(null, null, null);
      //append camera to anonymous user account
      await deleteCamera(surveyName);
    }
  }

  @override
  Stream<UserModel> listenUserEvents() async* {
    Stream<User> stream = _auth.authStateChanges();
    await for (var event in stream) {
      yield UserModel.fromUserObj(event);
    }
  }

  @override
  Future<void> resendConfirmationEmail(String email, String password) async {
    String oldId;
    //saves old id
    if (_auth.currentUser != null) {
      ///////////upgrade to logged user
      //get anonymous user login
      oldId = _auth.currentUser.uid;
      //delete anonymous user
      await _auth.currentUser.delete();
    }

    String tmp = await _signInWithEmailAndPassword(email, password);

    if (tmp == 'verify') {
      await _auth.currentUser.sendEmailVerification();
      await signOut();
    }

    //copy old data
    if (oldId != null) {
      _deleteAndtransferDataFromOldId(oldId);
    }
    //verify if login was successful
    if (tmp != null) {
      return UserModel(email: tmp);
    } else {
      return UserModel(email: 'error');
    }

    await signOut();
    //copy old data
    if (oldId != null) {
      _deleteAndtransferDataFromOldId(oldId);
    }
  }
}
