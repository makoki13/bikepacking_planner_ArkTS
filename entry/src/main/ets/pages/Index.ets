// src/main/ets/pages/MainPage.ets
import { CustomButton } from 'ets/pages/CustomBoton'

@Entry
@Component
struct MainPage {
  build() {
    Column({ space: 20 }) {
      CustomButton({
        label: 'Nuevo proyecto',
        targetPage: 'pages/Nuevo'
      })

      CustomButton({
        label: 'Proyecto actual',
        targetPage: 'pages/Actual'
      })

      CustomButton({
        label: 'Lista de proyectos',
        targetPage: 'pages/Listado'
      })

      CustomButton({
        label: 'Configuración',
        targetPage: 'pages/Configuracion'
      })

      CustomButton({
        label: 'Ayuda',
        targetPage: 'pages/Ayuda'
      })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
  }
}