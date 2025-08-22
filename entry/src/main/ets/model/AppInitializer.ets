// model/AppInitializer.ets
import { Recolector } from '../data/Recolector';
import { ModelosRecolector } from '../data/Recolector';
import { Proyecto, ListaProyectos } from '../data/Recolector';

export function initAppData(): void {
  let tipoRecolector: ModelosRecolector = 'JSON'
  let recolector = new Recolector()
  recolector.setRecolector(tipoRecolector)

  let miLista : ListaProyectos
  miLista = recolector.getListaProyectos()
  miLista.forEach((elemento: Proyecto) => {
    console.info(`id: ${elemento.id} nombre: ${elemento.nombre}`)
  })
}