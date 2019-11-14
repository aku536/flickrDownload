flickrDownload
===
Фреймворк для удобного доступа к API Flickr и загрузке фотографий и их описаний.

Актуальная версия - v1.1.1. Для подключения вставьте в Carthage файл следующий код:

`github "aku536/flockrDowmload" == 1.1.1`

Для подключения фреймворка введите в Терминале:

`carthage update --platform iOS`

Затем добавьте flickrDownloadFramework в настройке проекта в Linked Framework and Libraries. Для корректной работы также необходимо добавить библиотеку в Embedded Binaries.

Для работы нужно создать interactor:

`let interactor: InteractorInput`

И воспользоваться его методами

1. `func loadImageList(by searchngString: String, completion: @escaping([ImageModel]) -> Void)`
Загружает список доступных изображений по заданному ключевому слову
2. `func loadImage(at path: String, completion: @escaping (UIImage?) -> Void)`
Загружает изображение по адресу

Пример использования в коде:

```
private func loadData() {
  // Получаем список изображений по слову "cat"
  interactor.loadImageList(by: "cat") { (models) in

  for index in 0...10 {
    self.flickrImages.append(models[index]) // добавляем первые 10 изображений в свою модель
  }

  // Загружаем каждое изображение из модели, сохраняем изображения в модели и обновляем таблицу
  for fImage in self.flickrImages {
    let imagePath = fImage.path
    self.interactor.loadImage(at: imagePath) { [weak self] image in
      if let image = image {
        let model = ImageViewModel(description: fImage.description, image: image)
        self?.images.append(model)
        DispatchQueue.main.async {
          self?.tableView.reloadData()
        }
      }
     }
   }
  }
}
```
