import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //creamos una lista de _personas
  //poner <Personas> significa que voy a poner valores correspondientes
  //a la clase Personas

  //cuando se maneja una API se maneja una lista de objetos
  //
  List<Persona> _personas = [
    Persona("Diego", "O", "326655"),
    Persona("Juan", "Martinez", "88445"),
    Persona("Manuel", "Sanchez", "84435"),
    Persona("Ana", "Torres", "894456"),
    Persona("Maria", "Lopez", "88963"),
    Persona("Karen", "Moreno", "23184")
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Material App",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Material App Bar"),
        ),
        body: Center(
            //cuando representamos listas apartir de una variable
            //se usa un listview.builder es decir un contructor de listas
            child: ListView.builder(
                //itemcount me cuenta la cantida de items en la lista
                //y le dice al constructor hasta que cantidad de items debe llegar

                itemCount: _personas.length,
                //itemBuilder es un constructor de items
                //por cada llamado del builder (constructor) varia el index , index seria el tipico i en un for
                itemBuilder: (context, index) {
                  return Text(_personas[index].nombre);
                })),
      ),
    );
  }
}

//clase Personas
//si me equivoque de nombre en alguna clase puedo usar F2 y cambiarla
class Persona {
  late String nombre;
  late String apellido;
  late String telefono;

  //metodo de la clase Personas
  Persona(nombre, apellido, telefono) {
    this.nombre = nombre;
    this.apellido = apellido;
    this.telefono = telefono;
  }
}
