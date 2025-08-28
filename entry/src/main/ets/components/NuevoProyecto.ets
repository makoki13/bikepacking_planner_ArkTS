import { BusinessError } from '@kit.BasicServicesKit'
import { IdProyecto } from "../data/Recolector"
import { promptAction } from '@kit.ArkUI'

@Component
export struct NuevoProyecto {
  @Prop indice: IdProyecto

  strPlaceholder(): string {
    const strPlaceHolder = this.indice === undefined
      ? "Ingrese el nombre del proyecto"
      : "";
    return strPlaceHolder
  }

  strTitulo(): string {
    const strPlaceHolder = this.indice === undefined
      ? "Nuevo Proyecto"
      : "";
    return strPlaceHolder
  }

  build() {

    Column() {
      Text(this.strTitulo())
        .fontSize(24)
        .fontColor(Color.Black)
        .fontWeight(FontWeight.Bolder)
        .align(Alignment.Top)
        .margin({bottom: 10})
      Text("Nombre:")
        .fontSize(16)
        .fontColor(Color.Black)
        .align(Alignment.Top)
        .alignSelf(ItemAlign.Start)

      TextInput({ placeholder: this.strPlaceholder() })
        .placeholderColor(Color.Blue)
        .alignSelf(ItemAlign.Start)
        .borderRadius(8)
        .borderColor(Color.Black)
        .borderWidth(2)
        .backgroundColor(Color.White)
        .shadow({ radius: 4, color: '#ddd' })
        .margin({ bottom: 15 })
      Button("GUARDAR")
        .width(200)
        .height(50)
        .fontSize(30)
        .fontWeight(FontWeight.Bolder)
        .backgroundColor("F0CAB0")
        .fontColor('#FFFFFF')
        .borderRadius(8)
        .borderWidth(2)
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
    //.backgroundColor(Color.Red)
    .padding({ top: 20, left: 20, right: 20 }) // Margen desde arriba
    .width('100%')
    .height('100%')
  }
}