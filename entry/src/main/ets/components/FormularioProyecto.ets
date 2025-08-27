import { BusinessError } from '@kit.BasicServicesKit'
import { IdProyecto } from "../data/Recolector"
import { promptAction } from '@kit.ArkUI'

@Component
export struct FormularioProyecto {
  @Prop indice: IdProyecto

  build() {
    Column() {
      Text("Nombre:")
        .fontSize(16)
        .fontColor(Color.Black)
      TextInput({ placeholder: "Ingrese el nombre del proyecto" })
        .placeholderColor(Color.Blue)
        .align(Alignment.Center)
      Button("GUARDAR")
        .width(200)
        .height(50)
        .backgroundColor("F0CAB0")
        .fontColor('#FFFFFF')
        .borderRadius(8)
        .onClick(() => {
          AlertDialog.show({
            title: 'Confirmar salida',
            message: '¿Estás seguro de que deseas salir de la aplicación?',
            primaryButton: {
              value: 'Sí',
              action: () => {
                console.info('Saliendo...')
              }
            }
          })
        })
    }
  }
}