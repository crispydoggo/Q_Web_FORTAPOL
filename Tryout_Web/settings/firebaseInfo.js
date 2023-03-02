
  const firebaseConfig = {
    apiKey: "AIzaSyD-iUoBVDKTuoX5U9axqAcb78bPpGnuA8k",
    authDomain: "id-trials.firebaseapp.com",
    projectId: "id-trials",
    storageBucket: "id-trials.appspot.com",
    messagingSenderId: "887003994740",
    appId: "1:887003994740:web:ad3c492efc8dde12660f21"
  };
  
  firebase.initializeApp(firebaseConfig);  
  var rootRef = firebase.database().ref();