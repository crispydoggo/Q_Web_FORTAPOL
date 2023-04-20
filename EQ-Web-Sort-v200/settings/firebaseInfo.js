
  const firebaseConfig = {
    apiKey: "AIzaSyAydbT6DVFV2lGprwdeKxYruDBf4xZYF3g",
    authDomain: "habilidades-ppi.firebaseapp.com",
    projectId: "habilidades-ppi",
    storageBucket: "habilidades-ppi.appspot.com",
    messagingSenderId: "860302372253",
    appId: "1:860302372253:web:fa56469daf439038085374"
  };
  
  firebase.initializeApp(firebaseConfig);  
  var rootRef = firebase.database().ref();