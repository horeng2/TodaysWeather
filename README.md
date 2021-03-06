# ๐คย ์ค๋์ ๋ ์จ

- ํ๋ก์ ํธ ๊ธฐ๊ฐ: 2022. 06. 10 ~ 06. 15.
- RxSwift๋ก ๋ฆฌํฉํ ๋ง ์์ ์๋๋ค.

# ๋ชฉ์ฐจ

- ํ๋ก์ ํธ ์๊ฐ
- ํค์๋
- ๊ธฐ์  ์คํ
- ๊ตฌํ ๊ธฐ๋ฅ
- ๊ณ ๋ฏผํ๋ ์ 
- Trouble Shooting

## ํ๋ก์ ํธ ์๊ฐ

์ฌ๋ฌ ์ง์ญ์ ๋ ์จ ์ ๋ณด๋ฅผ ๋ชฉ๋ก์์ ๊ฐ๋จํ๊ฒ ๋ณผ ์ ์๊ณ , ํด๋ฆญ ์ ์์ธํ ๋ ์จ๋ฅผ ์กฐํํ  ์ ์๋ ์ฑ์๋๋ค.

OpenWeather API๋ฅผ ์ด์ฉํด์ ๋ ์จ ์ ๋ณด๋ฅผ ๋ถ๋ฌ์ต๋๋ค.

## ํค์๋

- `UIKit` `MVVM ํจํด` `Clean Architecture`
- `URLSession` `URLRequest` `API`
- `JSON` `Codable`
- `UITableView` `CustomCell`
- `NSCache`

## ๊ธฐ์  ์คํ

### ๊ตฌ์กฐ

- MVVM
- Clean Architecture

### UI

- UIKit
- StoryBoard
- Localization

### Network

- URLSession
- Codable
- JSONDecoder

### Caching

- NSCache

## ๊ตฌํ ๊ธฐ๋ฅ

- ์ฌ๋ฌ ๋์์ ๊ฐ๋ตํ ๋ ์จ ์ ๋ณด๋ฅผ ๋ชฉ๋ก์ผ๋ก ๋ณผ ์ ์๋ ๊ธฐ๋ฅ
- ์์ธ ๋ ์จ ์กฐํ ๊ธฐ๋ฅ
- ํ๊ตญ์ด/์์ด์ ๋ํ Localization ๊ตฌํ
- ์ด๋ฏธ์ง์บ์ฑ ๊ตฌํ

### ๊ตฌ๋ ํ๋ฉด 
### (๋นํ๋ณธ ์์ผ๋ก๋ ์์ด์ฝ์ด ๋ค๋ฆ๊ฒ ๋จ๋ ๊ฒ์ผ๋ก ๋ณด์ด๋๋ฐ, ์ค์  ์๋ฎฌ๋ ์ดํฐ์ ๊ธฐ๊ธฐ์์ ๊ตฌ๋ ์ ๋๋ ์ด ๋ฐ์ํ์ง ์์ต๋๋ค!)

![Simulator Screen Recording - iPhone 13 - 2022-06-15 at 18 24 18](https://user-images.githubusercontent.com/87305744/174059820-120fa098-f498-48d5-8fb1-6a7caf5feed9.gif)

![Simulator Screen Recording - iPhone 13 - 2022-06-15 at 18 23 31](https://user-images.githubusercontent.com/87305744/174059813-6a2e6437-770a-4c47-b40e-994bbe5d4323.gif)



## ๊ณ ๋ฏผํ๋ ์ 

### UIKit์ MVVM ๊ตฌ์กฐ์์ View-ViewModel๊ฐ ๋ฐ์ดํฐ ์ ๋ฌ ๋ฐฉ์

1. ViewModel์์ ๋ฐ์ดํฐ ํ๋กํผํฐ `allWeatherInfo`์ didSet์ ๊ตฌํํ๊ณ , didSet ๋ด๋ถ์ ๋ทฐ๋ชจ๋ธ ์์ ์ ํ๋กํผํฐ `allWeatherInfoUpdated`๋ฅผ ํธ์ถํฉ๋๋ค.
    
    ```swift
    var allWeatherInfoUpdated: () -> Void = {}
        var allWeatherInfo: [WeatherInformation] = [] {
            didSet {
                if allWeatherInfo.count == City.allCases.count {
                    self.allWeatherInfo = self.allWeatherInfo.sorted {
                        $0.cityName < $1.cityName
                    }
                    self.allWeatherInfoUpdated()
                }
            }
        }
    ```
    
2. ViewController์ viewDidLoad์์ ๋ทฐ๋ชจ๋ธ์ ํ๋กํผํฐ `allWeatherInfoUpdated`์ ํด๋ก์  ๋ด์ฉ์ ์ค์ ํฉ๋๋ค.
    
    ```swift
    self.weatherListViewModel.allWeatherInfoUpdated = {
                self.listTableViewDataSource = self.weatherListViewModel.allWeatherInfo
                DispatchQueue.main.async {
                    self.listTableView.reloadData()
                }
            }
    ```
    
- ๊ฒฐ๊ณผ์ ์ผ๋ก, ๋ทฐ๋ชจ๋ธ `allWeatherInfo` ๋ฐ์ดํฐ์ `didSet`์ด ์คํ๋  ๋๋ง๋ค ๋ทฐ์ปจํธ๋กค๋ฌ์์ ์ค์ ํ ์ฝ๋๊ฐ ์ํ๋ฉ๋๋ค. ํ์ฌ ์ฝ๋์์๋ ๋ฐ์ดํฐ์ ๋ณ๋์ด ์๊ธธ ๋๋ง๋ค `tableView์ reloadData()`๊ฐ ์คํ๋ฉ๋๋ค.

### API์์ ์ ๋ณด๋ฅผ ๋ฐ์์ค๋ ๋ฐฉ์์ ๋ํ ๊ณ ๋ฏผ

- ํ์ฌ๋ ๋ด์ฅ geocoding๊ฐ ์ด์ฉํด์ ๋์ ์ด๋ฆ๋ง์ผ๋ก ํ๋ฒ์ ๋ ์จ ์ ๋ณด๋ฅผ ๋ฐ์์ฌ ์ ์์ง๋ง, ๊ณง ์ค๋จ ์์ ์ด๋ ๋ณ๋์ Geocoding API ์ฌ์ฉ์ ๊ถ์ฅํ๋ ์๋ ๋ฌธ๊ตฌ๊ฐ ์์์ต๋๋ค.
- ๋ฐ๋ผ์ ๋ณ๋์ Geocoding API๋ฅผ ์ด์ฉํด์ ๋์ ๋ณ ์ขํ ์ ๋ณด๋ฅผ ๋ฐ์์จ ๋ค, ์ด๋ฅผ ์ด์ฉํด์ ๋ ์จ๋ฅผ ๋ฐ์์ค๋ ๊ตฌ์กฐ๋ก ์ค๊ณํ์ต๋๋ค.

![Untitled](https://user-images.githubusercontent.com/87305744/174059852-0547914a-6ad7-40cc-be1a-d4072e223879.png)


### Clean Architecture๋ก ์ค๊ณํ๋ฉด์, ๊ฐ ๊ณ์ธต ์ญํ ์ ๋ํด ๊ณ ๋ฏผ

- Data๊ณ์ธต(Repository): apiProvider๋ฅผ ํตํด Data๋ฅผ ๋ฐ์์ค๋ ์ญํ 
- Domain๊ณ์ธต(UseCases): Data๋ฅผ ์ด์ฉํด์ ViewModel์์ ์ฌ์ฉํ  ์ ์๋ ๋ฐ์ดํฐ ํ์์ผ๋ก ๋ฐ๊พธ๋ ์ญํ 
- Presentation๊ณ์ธต: View์ ๋์์ ๋ฐ๋ผ ํ์ํ ๋ฐ์ดํฐ์์ค๋ฅผ ViewModel์์ ์ ๋ฌํด์ค

## Trouble Shooting

์ด์ ๊ด๋ฆฌ ๋ด์ฉ: [๋งํฌ](https://github.com/horeng2/wanted_pre_onboarding/issues?q=is%3Aissue+is%3Aclosed)

- ๋ฐ์ดํฐ๊ฐ ๋ก๋๋๊ธฐ ์ ์ TableView๊ฐ ๋จผ์  ๊ทธ๋ ค์ ธ์ ์ ์๋์ ๋น TableView ๋ชฉ๋ก์ด ๋ณด์ด๋ ๋ฌธ์ 
    - ๋ฐ์ดํฐ ๋ก๋ฉ ์๋๋ฅผ ๊ฐ์ ํ๊ธฐ ์ํด์ ViewModel์์ completionHandler๋ฅผ ์ด์ฉํด ๋ฐ์ดํฐ๋ฅผ View์ ์ ๋ฌํ๋ ์๋
    โ ๋ฐ์ดํฐ์ ํ๋ฆ์ ์ฐ๊ฒฐํ  ๋ฟโฆ View์ ๋์์ ๋ฐ๋ผ ViewModel์ด ๋ฐ์ํ๋ ๊ฒ์ด ์๋๋ผ๋ ์ ์์ MVVM ํจํด๊ณผ ๋ง์ง ์๋ค๊ณ  ํ๋จํ์ต๋๋ค.
    - didSet์ ์ด์ฉํ ๋ฐฉ๋ฒ์ผ๋ก ๋ค์ ๋ณ๊ฒฝํ๊ณ , ๋ฐ์ดํฐ ๋ก๋ฉ์ด ์๋ฃ๋์ด ๋ฐ์ดํฐ๊ฐ ์ค๋น๋  ๋๊น์ง tableView๊ฐ ๋ณด์ด์ง ์๊ณ  ๋ก๋ฉ ์๋ด ํ๋ฉด์ด ๋ณด์ด๋๋ก ํ์ต๋๋ค.
