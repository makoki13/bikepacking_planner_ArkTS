import { ListaProyectos } from "../data/Recolector";
import { Suministradores } from "../data/Suministrador";

// services/AventuraService.ts
const ProyectosMock: ListaProyectos = Suministradores.pideListaDeProyectos()

export class ProyectosService {
  async obtenerPagina(pagina: number, limite: number = 10): Promise<ListaProyectos> {
    const inicio = (pagina - 1) * limite;
    const fin = inicio + limite;
    // Simulamos un retraso de red
    await new Promise<void>(resolve => setTimeout(resolve, 800));
    return ProyectosMock.slice(inicio, fin);
  }
}