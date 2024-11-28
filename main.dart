import 'dart:io';

void main() {
  menu();
}


void menu() {
  String? opcion = "";
  Set<String> mySetGenres = {};
  List<String> listTasks = [];
  Map<String?, Map<String, String?>> mapStudents = {};
  do {
    print("1.  Agregar genero favorito");
    print("2.  Eliminar genero favorito");
    print("3.  Mostrar Generos");
    print("4.  Agregar Tarea");
    print("5.  Eliminar Tarea");
    print("6.  Mostrar Tareas");
    print("7.  Agregar Estudiante");
    print("8.  Eliminar Estudiante");
    print("9.  Mostrar Estudiantes");
    print("10. Salir");

    print(">> Selecciona una opción: ");
    opcion = stdin.readLineSync();

    elegirOpcion(opcion, mySetGenres, listTasks, mapStudents);
  } while(opcion != "10");

}


void elegirOpcion(String? opcion, Set<String> mySetGenres, List<String> listTasks, Map<String?, Map<String, String?>> mapStudents) {
  if (opcion == "1") agregarGenero(mySetGenres);
  if (opcion == "2") eliminarGenero(mySetGenres);
  if (opcion == "3") mostrarGeneros(mySetGenres);
  if (opcion == "4") agregarTarea(listTasks);
  if (opcion == "5") eliminarTarea(listTasks);
  if (opcion == "6") mostrarTareas(listTasks);
  if (opcion == "7") agregarEstudiante(mapStudents);
  if (opcion == "8") eliminarEstudiante(mapStudents);
  if (opcion == "9") mostrarEstudiantes(mapStudents);
}


/**
 * Estás desarrollando una aplicación sencilla para gestionar las calificaciones de los
 * estudiantes. Para cada estudiante, se almacena su nombre y la calificación que ha
 * obtenido.
 */

void mostrarEstudiantes(Map<String?, Map<String, String?>> mapStudents) {

  if (mapStudents.isNotEmpty) {
    for(MapEntry estudiante in mapStudents.entries) {
      print("Nombre: ${estudiante.key}");
      Map<String, String?> notas = estudiante.value;
      for(MapEntry nota in notas.entries) {
        print("   ${nota.key} = ${nota.value}");
      }
    }
  } else {
    print("No hay estudiantes registrados");
  }



}

void eliminarEstudiante(Map mapStudents) {
  print("Introduce el nombre del alumno: ");
  var nombre = stdin.readLineSync();
  if (mapStudents.containsKey(nombre)) {
    mapStudents.remove(nombre);
  } else {
    print("Este alumno no existe");
  }

}

void agregarEstudiante(Map mapStudents) {
  print("Introduce el nombre del alumno: ");
  var nombre = stdin.readLineSync();

  if (!mapStudents.containsKey(nombre)) {

    print("Introduce su nota en DIN: ");
    var din = stdin.readLineSync();
    print("Introduce su nota en PDMD: ");
    var pmdm = stdin.readLineSync();
    print("Introduce su nota en ADAT: ");
    var adat = stdin.readLineSync();
    print("Introduce su nota en PSP: ");
    var psp = stdin.readLineSync();
    print("Introduce su nota en SGE: ");
    var sge = stdin.readLineSync();
    mapStudents[nombre] = {"DIN":din, "PDMD":pmdm, "ADAT":adat, "PSP":psp, "SGE":sge};

  } else {
    print("Este alumno ya existe en la base de datos");
  }
}


/**
 * Estás desarrollando una aplicación básica de tareas donde los usuarios pueden
 * agregar y ver tareas que necesitan hacer. La lista de tareas se muestra de forma
 * secuencial y el usuario puede verlas en el orden en que las agregó.
 */

void mostrarTareas(List<String> listTasks) {

  if (listTasks.isNotEmpty) {
    print("Tareas:");

    for (String i in listTasks) {
      print(i);
    }
  } else {
    print("No hay ninguna tarea añadida.");
  }



}

void eliminarTarea(listTasks) {

  print("Introduce el nombre de la tarea a eliminar: ");
  var tarea = stdin.readLineSync();

  if(listTasks.remove(tarea)){
    print("Tarea eliminada");
  }

}

void agregarTarea(listTasks) {

  print("Introduce el nombre de la tarea: ");
  var tarea = stdin.readLineSync();

  if (tarea != null) {
    listTasks.add(tarea);
    print("Tarea añadida");
  }
}


/**
 * Estás desarrollando una aplicación para gestionar géneros musicales favoritos. El
 * usuario puede añadir géneros a su lista, pero hay restricciones. Primero, no puede
 * añadir géneros duplicados. Segundo, el usuario solo puede tener un máximo de 5
 * géneros favoritos. Si intenta añadir un sexto género, se debe mostrar un mensaje de
 * error.
 */

void mostrarGeneros(Set<String> mySetGenres) {

  if(mySetGenres.isNotEmpty) {
    print("Géneros favoritos:");
    for (String i in mySetGenres) {
      print(i);
    }
  } else {
    print("No hay géneros favoritos añadidos.");
  }
}

void eliminarGenero(Set<String> mySetGenres) {
  print("Introduce el nombre del género a eliminar: ");
  var genero = stdin.readLineSync();

  if (mySetGenres.contains(genero)) {
    if(mySetGenres.remove(genero)) {
      print("Genero $genero eliminado de la lista de favoritos");
    }
  } else {
    print("Este género no existe en la lista");
  }
}

void agregarGenero(Set<String> mySetGenres) {

    print("Introduce el nombre del género: ");
    var genero = stdin.readLineSync();

    if (mySetGenres.length < 5) {
      if (genero != null) {
        if(!mySetGenres.add(genero)){
          print("Error no se puede añadir el mismo género dos veces.");
        }
        } else {
          print("Error no se pueden añadir más géneros.");
        }
      }

}