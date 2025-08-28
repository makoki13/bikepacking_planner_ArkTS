// Second.ets
import { BusinessError } from '@kit.BasicServicesKit'
import { NuevoProyecto } from '../components/NuevoProyecto';

@Entry
@Component
struct Second {
  @State message: string = 'Nuevo proyecto';


  build() {
    Row() {
      Column() {
        NuevoProyecto({indice: undefined})
          .height("80%")
        Button() {
          Text('Back')
            .fontSize(30)
            .fontWeight(FontWeight.Bold)
            .fontColor(Color.White)
        }
        .type(ButtonType.Capsule)
        .margin({
          top: 10,
          bottom: 10
        })
        .borderWidth(2)
        .backgroundColor('#0D9FFB')
        .width('40%')
        .height('6%')
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
      //.backgroundColor(Color.Green)
    }
    .height('100%')
  }
}