// Second.ets
import { BusinessError } from '@kit.BasicServicesKit'
import { VisorListaProyectos } from '../components/VisorListaProyectos'

@Entry
@Component
struct Second {
  @State message: string = 'Listado';


  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .height("auto")

        VisorListaProyectos()
          .height("80%")

        Button() {
          Text('Back')
            .fontSize(30)
            .fontWeight(FontWeight.Bold)
        }
        .type(ButtonType.Capsule)
        .margin({
          top: 10
        })
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
    }
    .height('100vw')
  }
}