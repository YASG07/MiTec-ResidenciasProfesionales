//Variable que contiene el elemento #formulario del documentos html
const formulario = document.querySelector('#formulario');
/*Función log_in:
    @var in: --;
    @var out: --;
*/
function log_in(){
     //Captura del valor en las cajas de texto
     const NuControl = document.querySelector('.txtNC').value
     const NIP = document.querySelector('.txtNIP').value
     //Comparación de los valores en las cajas de texto
     if(NuControl == '' || NIP == ''){
        if(NuControl != ''){
            alert('Debe proporcionar su NIP');
        }//NuControl
        else{
             alert('Debe proporcionar Número de control y NIP');
        }//NuControl
     }//NuControl || NIP
     else{
         //Valores para acceder al formulario de registro
        if(NuControl == 'root' && NIP == 'admin'){
            window.location='/Registro.html'; 
        }//NuControl && NIP
        else{
            alert('Mi loco dele pa´ fuera' );
            document.querySelector('.txtNC').value = '';
            document.querySelector('.txtNIP').value = '';
        }
     }//NuControl || NIP
}
//Evento añadido al botón de ingresar 
formulario.addEventListener('submit', e=>{
    e.preventDefault()
    log_in();//Llamada a la función log_in
});
