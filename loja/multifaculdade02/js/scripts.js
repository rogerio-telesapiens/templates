/*Códigos desenvolvidos pela OniLearning Technology 
Contato: https://www.onilearning.com/
*/
console.log("%cHello World! Desenvolvido por: OniLearning Technology", "background: linear-gradient(60deg, #270f81, #28268e, #2a389a, #3049a5, #3859af, #276abb, #127ac4, #0089cc, #009bd1, #00acd0, #00bbc9, #19c9be);\n  color: white;\n  display: block;\n  line-height: 25px;\n  height: 25px;\n  padding: 5px;");
/*
// botões:

// Verifica se o elemento com o ID "hub" existe
var elementoHub = document.getElementById('hub');
if (elementoHub) {
  // Altera o ID para "btn-atv"
  elementoHub.setAttribute('id', 'btn-atv');
  console.log('O ID do elemento foi alterado para "btn-atv".');
}*/

//Abrir página de sobrposição
overlayScreen = document.getElementById("overlayScreen");
overlayScreen.style.display = 'none';

function openScreen(){
  overlayScreen.style.display = 'initial';
}

function closeScreen(){
  overlayScreen.style.display = 'none';
}


//Dark Mode:

function change(e) {
    const modeBtn = document.getElementById('mode');
    if (modeBtn.checked === true) {
      document.documentElement.classList.remove("light")
      document.documentElement.classList.add("dark")
      window.localStorage.setItem('mode', 'dark');
    } else {
      document.documentElement.classList.remove("dark")
      document.documentElement.classList.add("light")
      window.localStorage.setItem('mode', 'light');
    }
  }

  mode = window.localStorage.getItem('mode');
  if (mode == 'dark') {
  modeBtn.checked = true;
  document.documentElement.classList.remove("light")
  document.documentElement.classList.add("dark")
}

  if (mode == 'light') {
  modeBtn.checked = false;
  document.documentElement.classList.remove("dark")
  document.documentElement.classList.add("light")
}

//Scrollar para o topo da página:
function topFunction() {
  document.body.scrollTop = 0; // For Safari
  document.documentElement.scrollTop = 0; // For Chrome, Firefox, IE and Opera
}

bkLib.onDomLoaded(function() { nicEditors.allTextAreas() }); // convert all text areas to rich text editor on that page

bkLib.onDomLoaded(function() {
      new nicEditor().panelInstance('area1');
}); // convert text area with id area1 to rich text editor.


console.log('Aplicação carregada');