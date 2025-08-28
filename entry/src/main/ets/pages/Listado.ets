// Second.ets
import { BusinessError } from '@kit.BasicServicesKit'
import { VisorListaProyectos } from '../components/VisorListaProyectos'

@Entry
@Component
struct Second {
  build() {
    Row() {
      Column() {

        VisorListaProyectos()
          .height("85%")

        Flex() {
          // Este espacio vacío crece y empuja lo de abajo al final
        }
        .layoutWeight(1)

        Button() {
          Text('Back')
            .fontSize(30)
            .fontWeight(FontWeight.Bold)
        }
        .type(ButtonType.Capsule)
        .margin({
          top: 10
        })
        .align(Alignment.Bottom)
        .backgroundColor('F0CAB0')
        .fontColor('#FFFFFF')
        .width('40%')
        .height('5%')
        .onClick(() => {
          console.info(`Succeeded in clicking the 'Back' button.`)
          // Obtain UIContext.
          let uiContext: UIContext = this.getUIContext();
          let router = uiContext.getRouter();
          try {
            // Return to the first page.
            router.back()
            console.info('Succeeded in returning to the first page.')
          } catch (err) {
            let code = (err as BusinessError).code;
            let message = (err as BusinessError).message;
            console.error(`Failed to return to the first page. Code is ${code}, message is ${message}`)
          }
        })
      }
      .width('100%')
      .height('100vw')
      //.backgroundColor(Color.Red)
    }
    //.backgroundColor(Color.Green)
    .height('100vw')
  }
}