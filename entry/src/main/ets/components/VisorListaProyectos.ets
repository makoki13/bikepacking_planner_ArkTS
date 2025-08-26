// pages/AventurasPage.ets
import { ListaProyectos, Proyecto } from '../data/Recolector';
import { ProyectosService } from '../viewmodel/ProyectosService';

@Entry
@Component
export struct VisorListaProyectos {
  @State proyectos: ListaProyectos = [];
  @State paginaActual: number = 1;
  @State cargando: boolean = false;
  @State noMasDatos: boolean = false;

  private service: ProyectosService = new ProyectosService();

  // Cargar primera página
  aboutToAppear(): void {
    this.cargarDatos();
  }

  private async cargarDatos(): Promise<void> {
    if (this.cargando || this.noMasDatos) return;

    this.cargando = true;
    try {
      const nuevos = await this.service.obtenerPagina(this.paginaActual);
      if (nuevos.length === 0) {
        this.noMasDatos = true;
      } else {
        this.proyectos = [...this.proyectos, ...nuevos];
        this.paginaActual++;
      }
    } catch (error) {
      console.error('Error al cargar aventuras:', error);
    } finally {
      this.cargando = false;
    }
  }

  build() {
    Column() {
      List({ space: 8 }) {
        ForEach(this.proyectos, (proyecto: Proyecto) => {
          ListItem() {
            Row() {
              // Icono según estado
              if (proyecto.actual) {
                Image($r('app.media.actual'))
                  .width(24)
                  .height(24)
              }

              Column() {
                Text(proyecto.nombre)
                  .fontSize(16)
                  .fontWeight(FontWeight.Medium)
                if (proyecto.fechaInicio) {
                  Text(`Inicio: ${proyecto.fechaInicio.toLocaleDateString()}`)
                    .fontSize(12)
                    .fontColor(Color.Black)
                }
              }
              .layoutWeight(1)
              .margin({ left: 12 })
              .backgroundColor('#BCDEFF')
            }
            .padding(12)
            .backgroundColor(Color.White)
            .borderRadius(8)
            .margin({ right: 16, left: 16, top: 16, bottom: 16 })
          }
        },  (proyecto: Proyecto) => proyecto.id.toString())

        // Item de carga al final
        if (this.cargando) {
          ListItem() {
            Row() {
              LoadingProgress()
                .width(24)
                .height(24)
              Text('Cargando más...')
                .fontSize(14)
                .margin({ left: 8 })
            }
            .justifyContent(FlexAlign.Center)
            .height(50)
          }
        }

        // Si no hay más datos
        if (this.noMasDatos && !this.cargando && this.proyectos.length > 0) {
          ListItem() {
            Text('No hay más aventuras')
              .fontSize(14)
              .fontColor(Color.Gray)
              .textAlign(TextAlign.Center)
              .width('100%')
          }
          .height(40)
        }
      }
      .listDirection(Axis.Vertical)
      .divider({
        strokeWidth: 1,
        color: 0xFFE0E0E0,
        startMargin: 16,
        endMargin: 16
      })
      .onReachEnd(() => {
        console.info('Fin de la lista alcanzado');
        this.cargarDatos();
      })
      .height('100%')
    }
    .width('100%')
    .backgroundColor(Color.White)
  }
}