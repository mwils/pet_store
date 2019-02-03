var app = {};

app.updateValueHints = function (val) {
  var i;
  var optionsEls = document.getElementsByClassName('att-option');
  for (i = 0; i < optionsEls.length; i++) {
    if (!optionsEls[i].classList.contains('att-opt-' + val.value)) {
      optionsEls[i].setAttribute("disabled", true);
    } else {
      optionsEls[i].removeAttribute("disabled");
    }
  }
}