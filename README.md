# 🌤 오늘의 날씨

프로젝트 기간: 2022. 06. 10 ~ 06. 15.

# 목차

- 프로젝트 소개
- 키워드
- 기술 스택
- 구현 기능
- 고민했던 점
- Trouble Shooting

## 프로젝트 소개

여러 지역의 날씨 정보를 목록에서 간단하게 볼 수 있고, 클릭 시 자세한 날씨를 조회할 수 있는 앱입니다.

OpenWeather API를 이용해서 날씨 정보를 불러옵니다.

## 키워드

- `UIKit` `MVVM 패턴` `Clean Architecture`
- `URLSession` `URLRequest` `API`
- `JSON` `Codable`
- `UITableView` `CustomCell`
- `NSCache`

## 기술 스택

### 구조

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

## 구현 기능

- 여러 도시의 간략한 날씨 정보를 목록으로 볼 수 있는 기능
- 상세 날씨 조회 기능
- 한국어/영어에 대한 Localization 구현
- 이미지캐싱 구현

### 구동 화면 
### (녹화본 상으로는 아이콘이 뒤늦게 뜨는 것으로 보이는데, 실제 시뮬레이터와 기기에서 구동 시 딜레이 발생하지 않습니다!)

![Simulator Screen Recording - iPhone 13 - 2022-06-15 at 18 24 18](https://user-images.githubusercontent.com/87305744/174059820-120fa098-f498-48d5-8fb1-6a7caf5feed9.gif)

![Simulator Screen Recording - iPhone 13 - 2022-06-15 at 18 23 31](https://user-images.githubusercontent.com/87305744/174059813-6a2e6437-770a-4c47-b40e-994bbe5d4323.gif)



## 고민했던 점

### UIKit의 MVVM 구조에서 View-ViewModel간 데이터 전달 방식

1. ViewModel에서 데이터 프로퍼티 `allWeatherInfo`에 didSet을 구현하고, didSet 내부에 뷰모델 자신의 프로퍼티 `allWeatherInfoUpdated`를 호출합니다.
    
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
    
2. ViewController의 viewDidLoad에서 뷰모델의 프로퍼티 `allWeatherInfoUpdated`의 클로저 내용을 설정합니다.
    
    ```swift
    self.weatherListViewModel.allWeatherInfoUpdated = {
                self.listTableViewDataSource = self.weatherListViewModel.allWeatherInfo
                DispatchQueue.main.async {
                    self.listTableView.reloadData()
                }
            }
    ```
    
- 결과적으로, 뷰모델 `allWeatherInfo` 데이터의 `didSet`이 실행될 때마다 뷰컨트롤러에서 설정한 코드가 수행됩니다. 현재 코드에서는 데이터의 변동이 생길 때마다 `tableView의 reloadData()`가 실행됩니다.

### API에서 정보를 받아오는 방식에 대한 고민

- 현재는 내장 geocoding가 이용해서 도시 이름만으로 한번에 날씨 정보를 받아올 수 있지만, 곧 중단 예정이니 별도의 Geocoding API 사용을 권장하는 아래 문구가 있었습니다.
- 따라서 별도의 Geocoding API를 이용해서 도시 별 좌표 정보를 받아온 뒤, 이를 이용해서 날씨를 받아오는 구조로 설계했습니다.

![Untitled](https://user-images.githubusercontent.com/87305744/174059852-0547914a-6ad7-40cc-be1a-d4072e223879.png)


### Clean Architecture로 설계하면서, 각 계층 역할에 대해 고민

- Data계층(Repository): apiProvider를 통해 Data를 받아오는 역할
- Domain계층(UseCases): Data를 이용해서 ViewModel에서 사용할 수 있는 데이터 타입으로 바꾸는 역할
- Presentation계층: View의 동작에 따라 필요한 데이터소스를 ViewModel에서 전달해줌

## Trouble Shooting

이슈 관리 내용: [링크](https://github.com/horeng2/wanted_pre_onboarding/issues?q=is%3Aissue+is%3Aclosed)

- 데이터가 로드되기 전에 TableView가 먼저 그려져서 잠시동안 빈 TableView 목록이 보이는 문제
    - 데이터 로딩 속도를 개선하기 위해서 ViewModel에서 completionHandler를 이용해 데이터를 View에 전달하는 시도
    → 데이터의 흐름을 연결할 뿐… View의 동작에 따라 ViewModel이 반응하는 것이 아니라는 점에서 MVVM 패턴과 맞지 않다고 판단했습니다.
    - didSet을 이용한 방법으로 다시 변경했고, 데이터 로딩이 완료되어 데이터가 준비될 때까지 tableView가 보이지 않고 로딩 안내 화면이 보이도록 했습니다.
