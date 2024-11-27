import 'dart:math';

void main() {
  print("Ejercicio 1");
  ejercicio1();
  print("");
  print("Ejercicio 2");
  ejercicio2();
  print("");
  print("Ejercicio 3");
  ejercicio3();
}


/**
 * Estás desarrollando una aplicación para gestionar géneros musicales favoritos. El
 * usuario puede añadir géneros a su lista, pero hay restricciones. Primero, no puede
 * añadir géneros duplicados. Segundo, el usuario solo puede tener un máximo de 5
 * géneros favoritos. Si intenta añadir un sexto género, se debe mostrar un mensaje de
 * error.
 */
void ejercicio1() {
  Set mySetGenres = {};
  var listGenres = ["Brutal metal", "Punk Rock", "Doom metal", "Metalcore", "Punk Rock", "Post hardcore", "Dark Cabaret"];
  for(String i in listGenres) {
    if (mySetGenres.length < 5) {
      if(!mySetGenres.add(i)){
        print("Error no se puede añadir el mismo género dos veces.");
      }

    } else {
      print("Error no se pueden añadir más géneros.");
    }
  }
  print(mySetGenres);
}

/**
 * Estás desarrollando una aplicación básica de tareas donde los usuarios pueden
 * agregar y ver tareas que necesitan hacer. La lista de tareas se muestra de forma
 * secuencial y el usuario puede verlas en el orden en que las agregó.
 */
void ejercicio2() {
  var listTasks = [];
  for(int i = 0; i < 7; i++) {
    listTasks.add("Tarea ${i + 1}");
  }
  for (String i in listTasks) {
    print(i);
  }
}

/**
 * Estás desarrollando una aplicación sencilla para gestionar las calificaciones de los
 * estudiantes. Para cada estudiante, se almacena su nombre y la calificación que ha
 * obtenido.
 */
void ejercicio3() {
  Map mapStudents = {};

  for(int i = 0; i < 7; i++) {
    mapStudents["Estudiante ${i + 1}"] = "Nota: ${Random().nextInt(10) + 1}";
  }

  for(var i in mapStudents.entries) {
    print("${i.key}: ${i.value}");
  }

}