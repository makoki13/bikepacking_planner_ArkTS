export type IdProyecto = number
class clsProyecto {
  id: IdProyecto = 0
  nombre: string = ""
  fechaInicio: Date | null = null;
  actual: boolean = false
}
export type Proyecto = clsProyecto
export type ListaProyectos = Array<Proyecto>

export type IdJornada = number
class clsJornada {
  id: IdJornada = 0
  nombre: string = ""
}
export type Jornada = clsJornada
export type ListaJornadas = Array<IdJornada>

interface IRecolector {
  getListaProyectos(): ListaProyectos
  getProyecto(idProyecto: IdProyecto): Proyecto
  getListaJornadas(idProyecto: IdProyecto): ListaJornadas
  getJornada(idProyecto: IdProyecto, idJornada: IdJornada): Jornada
}

export type ModelosRecolector = 'JSON' | 'SQLite'

export class Recolector implements IRecolector {
  protected gestor: IRecolector | null = null;

  setRecolector(gestor: ModelosRecolector) {
    switch (gestor) {
      case 'JSON':
        this.gestor = new RecolectorJson()
        break;
      case 'SQLite':
        this.gestor = new RecolectorSqlLite()
        break;
    }
  }

  private checkGestor(): void {
    if (!this.gestor) {
      throw new Error("Recolector no ha sido inicializado: gestor es null");
    }
  }

  public getListaProyectos(): ListaProyectos {
    this.checkGestor();
    return this.gestor!.getListaProyectos(); // El '!' indica que ya verificamos
  }

  public getProyecto(idProyecto: IdProyecto): Proyecto {
    this.checkGestor();
    return this.gestor!.getProyecto(idProyecto);
  }

  getListaJornadas(idProyecto: IdProyecto): ListaJornadas {
    this.checkGestor();
    return this.gestor!.getListaJornadas(idProyecto);
  }

  getJornada(idProyecto: IdProyecto, idJornada: IdJornada): Jornada {
    this.checkGestor();
    return this.gestor!.getJornada(idProyecto, idJornada);
  }
}

export class RecolectorJson extends Recolector implements IRecolector{
  constructor() {
    super()
    console.info('Consructor de RecolectorJson II');
  }

  getListaProyectos(): ListaProyectos {
    // Aquí iría la lógica real (ej: cargar de JSON)
    return [
      { id: 1, nombre: "Proyecto A", fechaInicio: new Date('2025/09/17'), actual: true },
      { id: 2, nombre: "Proyecto B" , fechaInicio: null, actual: false}
    ];
  }

  getProyecto(idProyecto: IdProyecto): Proyecto {
    const proyectos = this.getListaProyectos();
    return proyectos.find(p => p.id === idProyecto) || { id: 0, nombre: "", fechaInicio: null, actual: false };
  }

  getListaJornadas(idProyecto: IdProyecto): ListaJornadas {
    // Simulación
    if (idProyecto === 1) return [101, 102];
    return [];
  }

  getJornada(idProyecto: IdProyecto, idJornada: IdJornada): Jornada {
    // Simulación
    return { id: idJornada, nombre: `Jornada ${idJornada}` };
  }
}

export class RecolectorSqlLite extends Recolector implements IRecolector {
  constructor() {
    super();
  }

  // Aquí iría la lógica real con base de datos
  getListaProyectos(): ListaProyectos {
    return [{ id: 99, nombre: "SQLite Project", fechaInicio: null, actual: false }];
  }

  getProyecto(idProyecto: IdProyecto): Proyecto {
    return { id: idProyecto, nombre: `Proyecto ${idProyecto}`, fechaInicio: null, actual: false };
  }

  getListaJornadas(idProyecto: IdProyecto): ListaJornadas {
    return [501, 502, 503];
  }

  getJornada(idProyecto: IdProyecto, idJornada: IdJornada): Jornada {
    return { id: idJornada, nombre: `Jornada SQLite ${idJornada}` };
  }
}