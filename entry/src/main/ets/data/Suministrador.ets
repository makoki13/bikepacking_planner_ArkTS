import { IdJornada, Jornada, ListaJornadas, IdProyecto, Proyecto, ListaProyectos, Recolector } from './Recolector';
import { Almacen } from './Almacen'

export class Suministradores {
  //almacen: Almacen
  protected static  almacen: Almacen | null = null;

  public static inicializa() {
    if (!Suministradores.almacen) {
      Suministradores.almacen = new Almacen()
    }
  }

  public static pideListaDeProyectos() : ListaProyectos {
    Suministradores.inicializa()
    return Suministradores.almacen!.getListaProyectos();
  }

  public static pideProyecto(id_proyecto: IdProyecto): Proyecto {
    Suministradores.inicializa()
    return Suministradores.almacen!.getProyecto(id_proyecto)
  }

  public static PideJornadas(id_proyecto: IdProyecto): ListaJornadas {
    Suministradores.inicializa()
    return Suministradores.almacen!.getListaJornadas(id_proyecto)
  }

  public static PideJornada(id_proyecto: IdProyecto, idJornada: IdJornada): Jornada {
    Suministradores.inicializa()
    return Suministradores.almacen!.getJornada(id_proyecto, idJornada)
  }
}