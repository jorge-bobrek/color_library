# App Librería De Colores

Un simple proyecto que nos permite guardar y consultar en un listado nuestros colores favoritos en formato Hexadecimal o RGB.

![Deslizadores](./docs/sliders.png?raw=true)

Para crear o editar colores se hace uso de 3 deslizadores para los colores Rojo, Verde y Azul respectivamente, con una vista previa del color resultante al modificar cada uno de estos deslizadores, los cuales también muestran a su izquierda el valor en formato RGB.
En la parte superior se muestra un recuadro con el color resultante y su valor en Hexadecimal, el cual se mostrará en el listado de colores de la página principal una vez guardados los cambios.

# Desarrollo de la App

Este proyecto fue desarrollado en Flutter usando el lenguaje de programación Dart.
Se hace uso de [Clean Architecture](https://medium.com/bancolombia-tech/clean-architecture-en-flutter-cómo-implementarla-en-el-2023-34f4d28d06b5) como patrón para la arquitectura de la App.
Se utiliza la librería [Provider](https://pub.dev/packages/provider) para la gestión de estados dentro de la App.

# Objetivo del desarrollo

El objetivo de esta App es aprender los fundamentos básicos de Flutter, la creación de pantallas y widgets, el manejo de estados, la navegación, y los datos, cumpliendo también con los principios de código limpio, clean architecture y SOLID.