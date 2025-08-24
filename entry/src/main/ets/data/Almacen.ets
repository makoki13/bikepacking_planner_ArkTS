
import { IdJornada, Jornada, ListaJornadas, IdProyecto, Proyecto, ListaProyectos, Recolector } from './Recolector';

export class Almacen {
  miRecolector: Recolector

  constructor() {
    this.miRecolector = new Recolector()
    this.miRecolector.setRecolector('JSON')
  }

  public getListaProyectos(): ListaProyectos {
    return this.miRecolector.getListaProyectos()
  }

  getProyecto(idProyecto: IdProyecto): Proyecto {
    return this.miRecolector.getProyecto(idProyecto)
  }

  getListaJornadas(idProyecto: IdProyecto): ListaJornadas {
    return this.miRecolector.getListaJornadas(idProyecto)
  }

  getJornada(idProyecto: IdProyecto, idJornada: IdJornada): Jornada {
    return this.miRecolector.getJornada(idProyecto, idJornada)
  }
}