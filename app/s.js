/**
 * login.js
 * Script yang akan di load di halaman login
 * Usahakan menggunakan vanilla javascript (native) tanpa library
 * (semisal jQuery dsb) sehingga load halaman login cepat
 */

(function() {
    window.addEventListener("DOMContentLoaded", function() {
        var btnCek= getId('btCek');

        btnCek.onclick = function(me) {
            var user = document.getElementsByName('username')[0].value;
            var pwd  = document.getElementsByName('password')[0].value;
                pwd  = pwd ? md5(pwd) : '';
            var data = 'username=' + user + '&password=' + pwd;
            ajax('loginout.php', function(result) {
                var res = JSON.parse(result);
                if (res.success) {
                    msgLogin.style.display = 'none';
                    window.location = 'main.php';
                    var el = getId('loading-login');
                    if (el.classList.contains('is-hidden')) {
                        el.classList.remove('is-hidden');
                    }
                    var fl = getId('form-login');
                    fl.style.display = 'none';
                    return 1;
                } else {
                    msgLogin.innerHTML = res.msg;
                    fadeIn(msgLogin);
                }
            }, data);
            me.preventDefault();
        };
    });
}());

//# sourceURL=app/login.js
