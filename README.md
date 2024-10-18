![Banner](banner.jpg)  

# Módulo 6 - Desafío 2
# Carlos Santana

Ruby on Rails - postgresql

## Descripción

Esta aplicación realiza, usando un modelo de un Diario - TheRialNews,  el proceso de publicar noticias, realizar comentarios a las publicaciones y con control de acceso (Login, Logout, Sign_up, Recovery ) para publicar, comentar o sólo ver noticias y comentarios.  
  
OBS: - La publicación permite subir una imagen para ilustrar la noticia.  
     - Si se desea cambiar los datos del usuario debe hacer click sonbre su nombre en la barra de navegación.  
  
## Inicio

Estas instrucciones te ayudarán a obtener una copia del proyecto y a ejecutarlo en tu máquina local para fines de desarrollo y prueba.

### Pre-requisitos

Este proyecto fue desarrollado con Rails - versión 7 y PostgreSQL - versión 16.

### Instalación

Sigue estos pasos para ejecutar el proyecto localmente:
  
1. Clona este repositorio en tu máquina local.  
git clone https://github.com/crsantanag/m6d2.git  
  
2. Navega hasta el directorio del proyecto.  
cd m6d2  
  
3. Instala las dependencias y modifica archivo database.yml  
   Las gemas que se deben instalar son:  
   - faker (crea datos ficticios)  
   - pagy  (paginación)  
   - figaro (manejo de credenciales)  
   - devise (autenticación)  
   Adicionalmente debes instalar la gema ActiveStorage: rails active_storage:install  
  
4. Crea la base de datos, realiza la migración y carga los datos de prueba (ejecutar archivo seed.rb)  
    - rails db:create  
    - rails db:migrate  
    - rails db:seed  
  
## Ejecutando las pruebas
Levanta el servidor y prueba la aplición.  
root está en /  
  
Este proyecto cuenta con pruebas automatizadas. Sin embargo, también puedes probar manualmente todas las funcionalidades.  
  
## Licencia  
  
Este proyecto está bajo la Licencia MIT. Consulta el archivo [LICENSE.md](LICENSE.md) para obtener más detalles.  
  
⌨ ️Carlos Santana (https://github.com/crsantanag)

