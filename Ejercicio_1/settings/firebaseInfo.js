
  const firebaseConfig = {
    apiKey: "AIzaSyCRpuc40nPsz6HjTZVEYkjukTSohX8Mc0U",
    authDomain: "ejercicio-1-edd6d.firebaseapp.com",
    projectId: "ejercicio-1-edd6d",
    storageBucket: "ejercicio-1-edd6d.appspot.com",
    messagingSenderId: "607960334425",
    appId: "1:607960334425:web:a2a76fa0f8b3a81c5cf148"
  };
  
  firebase.initializeApp(firebaseConfig);  
  var rootRef = firebase.database().ref();