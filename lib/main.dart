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
      //Para quitar el banner de debug usamos debugshow..
      debugShowCheckedModeBanner: false,
      title: "Material App",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Lista"),
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
                  //un ListTile es un elemento de lista y trae propiedades para listas
                  return ListTile(
                    //ontap propiedad para hacer algo al pasar por un elemento
                    //onlongpress para hacer algo manteniendo presionado sobre el elemento
                    onLongPress: () {
                      this._borrarPersona(context, _personas[index]);
                    },
                    title: Text(_personas[index].nombre +
                        " " +
                        _personas[index].apellido),
                    subtitle: Text(_personas[index].telefono),
                    //leading para colocar un icono asociado a los items de la la lista al principio
                    leading: CircleAvatar(
                      child: Text(_personas[index].nombre.substring(0, 1)),
                    ),
                    //el trailing es como el leading pero al final
                    trailing: Icon(Icons.arrow_forward_ios),
                  );
                })),
      ),
    );
  }

//al definir Persona persona solo funciona si _borrarPersona recibe una instancia de Persona
  _borrarPersona(context, Persona persona) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Eliminar contacto"),
              content: Text(
                  "Esta seguro de querer eliminar a " + persona.nombre + "?"),
              actions: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 20)),
                    onPressed: () {
                      Navigator.pop(context);
                      print("oprimio cancelar");
                    },
                    child: Text("Cancelar")),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 20)),
                    onPressed: () {
                      //this.setState(){};

                      print("oprimio borrar");
                      print(persona.nombre);
                      //este this._personas hacer referencia a la lista
                      //y de ahi con remove quitamos la persona que se Recibe(),
                      this._personas.remove(persona);
                      Navigator.pop(context);
                    },
                    child: Text("Borrar"))
              ],
            ));
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

//para refrescar se necesita un widget que se llama RefreshIndicator pero necesita un future