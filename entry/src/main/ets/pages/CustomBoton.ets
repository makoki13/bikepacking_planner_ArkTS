// src/main/ets/components/CustomButton.ets
//import router from '@ohos.router';
import { BusinessError } from '@kit.BasicServicesKit'


@Component
export struct CustomButton {
  @Prop label: string = 'Button'
  @Prop targetPage: string = ''

  build() {
    Button(this.label)
      .width(200)
      .height(50)
      .backgroundColor('#007DFF')
      .fontColor('#FFFFFF')
      .borderRadius(8)
      .onClick(() => {
        console.info('Hizo click')
        let uiContext: UIContext = this.getUIContext()
        let router = uiContext.getRouter()
        router.pushUrl({url: 'pages/Nuevo'}).then(() => {
          console.info('Hemos saltado a la página menú')
        }).catch((err: BusinessError) => {
          console.error('No hemos podido saltar a la página de menú')
        })
      })
  }
}