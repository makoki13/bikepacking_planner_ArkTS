import router from '@ohos.router';
import { initAppData } from '../model/AppInitializer'; // Simulación de carga inicial
import taskPool from '@ohos.taskpool';
import { BusinessError } from '@kit.BasicServicesKit'

@Entry
@Component
struct SplashScreen {
  @State showSplash: boolean = true;

  build() {
    Stack() {
      Image($r('app.media.startIcon'))
        .objectFit(ImageFit.Fill)
        .width('100vw')
        .height('100vw')
        .zIndex(1)
        .opacity(0.4)

      Column() {
        LoadingProgress()
          .color(Color.Blue)
          .width(70)
          .height(70)
          .margin({ bottom: 20 })
          .zIndex(2) // Lo ponemos delante

        // Texto de carga
        Text('Loading...')
          .fontSize(38)
          .fontWeight(FontWeight.Bolder)
          .fontColor(Color.Black)
          .alignSelf(ItemAlign.Center)
          .zIndex(2)
      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)
      .backgroundColor(Color.White)
      .onAppear(() => {
        console.info(`Antes de startSplash`)
        this.startSplash();
        initAppData()
        console.info(`Despues de startSplash`)
      })
    }
    .padding(0)
    .margin(0)
    .width("100vw")
    .height("100vw")
    .layoutWeight(1)
  }

  private async startSplash() {
    // Tiempo mínimo de splash (2 segundos)
    const minSplashTime = 5000;

    // Iniciar carga de datos en segundo plano
    const loadDataPromise = this.loadInitialData();

    // Iniciar temporizador para cumplir con el tiempo mínimo
    const minTimePromise = new Promise<void>((resolve) => {
      setTimeout(() => {
        resolve();
      }, minSplashTime);
    });

    // Esperar a que AMBAS operaciones terminen: carga + tiempo mínimo
    await Promise.all([loadDataPromise, minTimePromise]);

    // Navegar a la página principal
    let uiContext: UIContext = this.getUIContext()
    let router = uiContext.getRouter()
    console.info(`Antes de pushUrl`)
    router.pushUrl({url: 'pages/Index'}).then(() => {
      console.info(`Hemos saltado a la página principal`)
    }).catch((err: BusinessError) => {
      console.error(`No hemos podido saltar a la página principal`)
    })
  }

  private async loadInitialData(): Promise<void> {
    return new Promise<void>((resolve, reject) => {
      const task = () => {
        try {
          // Simulación de carga pesada (API, DB, etc.)
          console.info('Datos inicializados before');
          initAppData(); // Tu lógica de inicialización
          resolve();
        } catch (err) {
          reject(err);
        }
      };

      // Ejecutar en task pool para no bloquear UI
      const taskObject = taskPool.execute(task);
      taskObject.then(() => {
        resolve();
      }).catch(() => {
        reject();
      });
    });
  }
}