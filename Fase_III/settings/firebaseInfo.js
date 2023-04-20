
  const firebaseConfig = {
    apiKey: "AIzaSyAwgmKlHvFvQ9wCYr-dnL43xpMNSs1xGR4",
    authDomain: "fortapol-taller.firebaseapp.com",
    projectId: "fortapol-taller",
    storageBucket: "fortapol-taller.appspot.com",
    messagingSenderId: "629344097555",
    appId: "1:629344097555:web:7146dfa8a7a163f96936e6"
  };
  
  firebase.initializeApp(firebaseConfig);  
  var rootRef = firebase.database().ref();