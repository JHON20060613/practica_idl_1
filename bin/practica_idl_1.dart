import 'dart:io';

// =============================================
// ENUNCIADO 1: CLASE ESTUDIANTE
// =============================================

class Estudiante {
  String nombre;
  double calificacion1;
  double calificacion2;
  double calificacion3;

  Estudiante(
    this.nombre,
    this.calificacion1,
    this.calificacion2,
    this.calificacion3,
  );

  double calcularPromedio() {
    return (calificacion1 + calificacion2 + calificacion3) / 3;
  }

  String determinarEstado() {
    if (calcularPromedio() >= 13) {
      return 'Aprobado';
    } else {
      return 'Desaprobado';
    }
  }

  void mostrarReporte() {
    print('\n--- REPORTE DEL ESTUDIANTE ---');
    print('Nombre: $nombre');
    print('Promedio: ${calcularPromedio().toStringAsFixed(2)}');
    print('Estado: ${determinarEstado()}');
  }
}

// =============================================
// ENUNCIADO 2: CLASE PRODUCTO
// =============================================

class Producto {
  String nombre;
  double precioUnitario;
  int cantidadDisponible;

  Producto(this.nombre, this.precioUnitario, this.cantidadDisponible);

  double calcularValorInventario() {
    return precioUnitario * cantidadDisponible;
  }

  String determinarEstadoStock() {
    if (cantidadDisponible == 0) {
      return 'Stock agotado';
    } else if (cantidadDisponible >= 1 && cantidadDisponible <= 5) {
      return 'Stock bajo';
    } else {
      return 'Stock suficiente';
    }
  }

  void mostrarInformacion() {
    print('\n--- INFORMACIÓN DEL PRODUCTO ---');
    print('Nombre: $nombre');
    print('Precio unitario: S/ ${precioUnitario.toStringAsFixed(2)}');
    print('Cantidad disponible: $cantidadDisponible');
    print(
      'Valor total del inventario: S/ ${calcularValorInventario().toStringAsFixed(2)}',
    );
    print('Estado del stock: ${determinarEstadoStock()}');
  }
}

// =============================================
// ENUNCIADO 3: CLASE VENDEDOR
// =============================================

class Vendedor {
  String nombre;
  double montoTotalVentas;

  Vendedor(this.nombre, this.montoTotalVentas);

  double calcularComision() {
    if (montoTotalVentas >= 2000) {
      return montoTotalVentas * 0.10;
    } else {
      return montoTotalVentas * 0.05;
    }
  }

  void mostrarReporte() {
    print('\n--- REPORTE DEL VENDEDOR ---');
    print('Nombre: $nombre');
    print('Monto total de ventas: S/ ${montoTotalVentas.toStringAsFixed(2)}');
    print('Comisión obtenida: S/ ${calcularComision().toStringAsFixed(2)}');
  }
}

// =============================================
// ENUNCIADO 4: CLASE REGISTRO DE TEMPERATURAS
// =============================================

class RegistroTemperaturas {
  List<double> temperaturas = [];

  void registrarTemperaturas() {
    print('\nIngrese las temperaturas de los cinco días:');

    for (int i = 1; i <= 5; i++) {
      double temperatura;

      while (true) {
        stdout.write('Temperatura del día $i en °C: ');
        String entrada = stdin.readLineSync() ?? '';
        entrada = entrada.replaceAll(',', '.');

        double? valor = double.tryParse(entrada);

        if (valor != null) {
          temperatura = valor;
          break;
        } else {
          print('Error: ingrese una temperatura válida.');
        }
      }

      temperaturas.add(temperatura);
    }
  }

  double calcularPromedio() {
    double suma = 0;

    for (double temperatura in temperaturas) {
      suma += temperatura;
    }

    return suma / temperaturas.length;
  }

  int contarDiasCalurosos() {
    int contador = 0;

    for (double temperatura in temperaturas) {
      if (temperatura > 30) {
        contador++;
      }
    }

    return contador;
  }

  void mostrarReporte() {
    print('\n--- REPORTE DE TEMPERATURAS ---');
    print('Promedio semanal: ${calcularPromedio().toStringAsFixed(2)} °C');
    print('Cantidad de días calurosos: ${contarDiasCalurosos()}');
  }
}

// =============================================
// FUNCIONES PARA SOLICITAR DATOS
// =============================================

String leerTexto(String mensaje) {
  while (true) {
    stdout.write(mensaje);
    String texto = stdin.readLineSync()?.trim() ?? '';

    if (texto.isNotEmpty) {
      return texto;
    }

    print('Error: escriba un dato válido.');
  }
}

double leerNumero(String mensaje) {
  while (true) {
    stdout.write(mensaje);
    String entrada = stdin.readLineSync() ?? '';
    entrada = entrada.replaceAll(',', '.');

    double? numero = double.tryParse(entrada);

    if (numero != null) {
      return numero;
    }

    print('Error: ingrese un número válido.');
  }
}

double leerPrecio() {
  while (true) {
    double precio = leerNumero('Ingrese el precio unitario: S/ ');

    if (precio > 0) {
      return precio;
    }

    print('El precio debe ser mayor que cero.');
  }
}

int leerCantidad() {
  while (true) {
    String entrada = leerTexto('Ingrese la cantidad disponible: ');
    int? cantidad = int.tryParse(entrada);

    if (cantidad != null && cantidad >= 0) {
      return cantidad;
    }

    print('La cantidad debe ser un entero mayor o igual a cero.');
  }
}

// =============================================
// FUNCIÓN PRINCIPAL: MAIN
// =============================================

void main() {
  // ENUNCIADO 1
  print('\n================================');
  print('ENUNCIADO 1: ESTUDIANTE');
  print('================================');

  String nombreEstudiante = leerTexto('Ingrese el nombre del estudiante: ');

  double nota1 = leerNumero('Ingrese la primera calificación: ');
  double nota2 = leerNumero('Ingrese la segunda calificación: ');
  double nota3 = leerNumero('Ingrese la tercera calificación: ');

  Estudiante estudiante = Estudiante(nombreEstudiante, nota1, nota2, nota3);

  estudiante.mostrarReporte();

  // ENUNCIADO 2
  print('\n================================');
  print('ENUNCIADO 2: PRODUCTO');
  print('================================');

  String nombreProducto = leerTexto('Ingrese el nombre del producto: ');
  double precio = leerPrecio();
  int cantidad = leerCantidad();

  Producto producto = Producto(nombreProducto, precio, cantidad);

  producto.mostrarInformacion();

  // ENUNCIADO 3
  print('\n================================');
  print('ENUNCIADO 3: VENDEDOR');
  print('================================');

  String nombreVendedor = leerTexto('Ingrese el nombre del vendedor: ');
  double ventas;

  while (true) {
    ventas = leerNumero('Ingrese el monto total de ventas: S/ ');

    if (ventas >= 0) {
      break;
    }

    print('El monto de ventas no puede ser negativo.');
  }

  Vendedor vendedor = Vendedor(nombreVendedor, ventas);
  vendedor.mostrarReporte();

  // ENUNCIADO 4
  print('\n================================');
  print('ENUNCIADO 4: TEMPERATURAS');
  print('================================');

  RegistroTemperaturas registro = RegistroTemperaturas();

  registro.registrarTemperaturas();
  registro.mostrarReporte();
}
