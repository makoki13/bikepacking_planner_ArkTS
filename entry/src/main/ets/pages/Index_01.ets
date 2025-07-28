import { BusinessError } from '@kit.BasicServicesKit'

@Entry
@Component
struct Index {
  @State message: string = 'Bikepacking Planner';

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .textAlign(TextAlign.Center)
        Button() {
          Text('Siguiente')
            .fontSize(28)
            .fontWeight(FontWeight.Bold)
            .fontColor(Color.White)
        }
        .type(ButtonType.Capsule)
        .margin({
          top: 20
        })
        .backgroundColor(Color.Green)
        .width('45%')
        .height('8%')
        .onClick(() => {
          console.info('Hizo click')
          let uiContext: UIContext = this.getUIContext()
          let router = uiContext.getRouter()
          router.pushUrl({url: 'pages/Second'}).then(() => {
            console.info('Hemos saltado a la página menú')
          }).catch((err: BusinessError) => {
            console.error('No hemos podido saltar a la página de menú')
          })
        })
      }
      .width('100%')
    }
      .height('100%')
  }
}