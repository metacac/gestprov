/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


// ESTABLECIENDO LAS CONSTANTES Y VARIABLES GLOBALES

const BOTONACCESS= document.getElementById('access');
const EMAIL = document.getElementsByName('email')[0];
const PASSWORD  = document.getElementById('password');
const EMAILERROR = document.querySelector('#correo + span.error');
const PASSWORDERROR = document.querySelector('#password + span.error');

let isValor= false;

//EVENTO AL HACER CLICK EN INGRESAR CON FUNCION EJECUTABLE Y LLAMADA PARA VALIDAR EL ENVIO DEL FORM
BOTONACCESS.addEventListener('click', function (event) {
    if((!PASSWORD.validity.valid) || (!EMAIL.validity.valid)){
        muestreError();
        event.preventDefault();
        alert('Se deben rellenar algunos campos antes de intentar el ingreso');
        PASSWORDERROR.innerHTML = '';
        EMAILERROR.textContent = '';
    };
});

//EVENTO CON FUNCION EJECUTABLE AL CAMBIAR EL CORREO
EMAIL.addEventListener('change', function (event) {
    color('email','#E8F0FE');
    if (EMAIL.validity.valid) {
        EMAILERROR.innerHTML = '';
        EMAILERROR.className = 'error';
    } else {
        muestreErrorCorreo();
    }
});

//FUNCION LLAMADA PARA VALIDAR EL ENVIO DEL FORM
function muestreError() {
    if(PASSWORD.validity.valueMissing) {
        color('password','pink');
        PASSWORDERROR.textContent = 'Falta la contraseña.';
    } else {
        PASSWORDERROR.innerHTML = '';}
    muestreErrorCorreo();
}
//FUNCION LLAMADA PARA VALIDAR EL FORMATO DEL CORREO
function muestreErrorCorreo() {
    if(EMAIL.validity.valueMissing) {
        EMAILERROR.textContent = 'Falta el usuario.';
        color('email','pink');
    } else if(EMAIL.validity.typeMismatch) {
        EMAILERROR.textContent = 'El valor introducido debe tener una la longitud miníma de 8 carácteres.';
        color('email','pink');
    } else if(EMAIL.validity.tooShort) {
        EMAILERROR.textContent = `El usuario debe tener al menos ${EMAIL.minLength} carácteres; y ha introducido ${ EMAIL.value.length }.`;
        color('email','pink');
    }
    EMAILERROR.className = 'error activo';
};
